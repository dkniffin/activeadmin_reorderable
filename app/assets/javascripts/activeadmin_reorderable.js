const setupReorderable = ({ table, onUpdate }) => {
  const rows = table.getElementsByTagName('tbody')[0].rows

  let dragSrc = null

  for (var i = 0; i < rows.length; i++) {
    const row = rows[i]
    const handle = row.querySelector(".reorder-handle")

    // Add draggable only when the handle is clicked, to prevent dragging from the rest of the row
    handle.addEventListener("mousedown", () => row.setAttribute("draggable", "true"))
    handle.addEventListener("mouseup", () => row.setAttribute("draggable", "false"))

    row.addEventListener("dragstart", (e) => {
      e.dataTransfer.effectAllowed = "move"

      dragSrc = row

      // Apply styling a millisecond later, so the dragging image shows up correctly
      setTimeout(() => { row.classList.add("dragged-row") }, 1)
    })

    row.addEventListener("dragover", (e) => {
      e.preventDefault()
      e.dataTransfer.dropEffect = "move"

      // If dragged to a new location, move the dragged row
      if (dragSrc != row) {
        const sourceIndex = dragSrc.rowIndex
        const targetIndex = row.rowIndex

        if (sourceIndex < targetIndex) {
          table.tBodies[0].insertBefore(dragSrc, row.nextSibling)
        } else {
          table.tBodies[0].insertBefore(dragSrc, row)
        }
        onUpdate(dragSrc)
      }
    })

    row.addEventListener("dragend", () => {
      // Disable dragging, so only the handle can start the dragging again
      row.setAttribute("draggable", "false")
      row.classList.remove("dragged-row")
      dragSrc = null
    })
  }
}

const updateEvenOddClasses = (row, index) => {
  row.classList.remove("odd")
  row.classList.remove("even")

  if ((index + 1) % 2 == 0) {
    row.classList.add("even")
  } else {
    row.classList.add("odd")
  }
}

const updatePositionText = (row, index) => {
  const position = row.querySelector(".position")
  if (position) {
    position.textContent = index
  }
}

const updateBackend = (url, rowIndex) => {
  let headers = { }

  const csrfElement = document.querySelector("meta[name=csrf-token]")
  if (csrfElement) {
    headers["X-CSRF-Token"] = csrfElement.getAttribute("content")
  } else {
    console.warn("Rails CSRF element not present. AJAX requests may fail due to CORS issues.")
  }

  const formData = new FormData()
  formData.append("position", rowIndex)

  fetch(url, { method: "POST", headers, body: formData })
}

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("table.aa-reorderable").forEach((table) => {
    setupReorderable({
      table,
      onUpdate: (row) => {
        const allRows = table.getElementsByTagName('tbody')[0].rows
        const handle = row.querySelector(".reorder-handle")
        const url = handle.dataset["reorderUrl"]
        const rowIndex = Array.prototype.indexOf.call(allRows, row)

        for (var i = 0; i < allRows.length; i++) {
          const loopRow = allRows[i]
          const index = i + 1
          updateEvenOddClasses(loopRow, index)
          updatePositionText(loopRow, index)
        }

        updateBackend(url, rowIndex + 1)
      }
    })
  })
})
