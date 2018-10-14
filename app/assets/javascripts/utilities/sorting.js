document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title');

  if (control) { control.addEventListener('click', sortRowsByTitle) };
})

function sortRowsByTitle() {
  var table = document.querySelector('table');

  var rows = table.querySelectorAll('tr');
  var sortedRows = [];

  // except head row
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]) ;
  }
  
  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    this.querySelector('.octicon-arrow-up').classList.remove('hide');
    this.querySelector('.octicon-arrow-down').classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    this.querySelector('.octicon-arrow-down').classList.remove('hide');
    this.querySelector('.octicon-arrow-up').classList.add('hide');
  }
  
  var sortedTable = document.createElement('table');

  sortedTable.classList.add('table');
  sortedTable.appendChild(rows[0]);

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i]);
  }
  table.parentNode.replaceChild(sortedTable, table);
}

function compareRowsAsc(row1, row2) {
  var titles = testsTitles(row1, row2);

  if (titles[0] < titles[1]) { return -1 };
  if (titles[0] > titles[1]) { return 1 };
  return 0;
}

function compareRowsDesc(row1, row2) {
  var titles = testsTitles(row1, row2);

  if (titles[0] < titles[1]) { return 1 };
  if (titles[0] > titles[1]) { return -1 };
  return 0;  
}

function testTitle(row) {
  return row.querySelector('td').textContent;
}

function testsTitles(row1, row2) {
  return [testTitle(row1), testTitle(row2)];
}
