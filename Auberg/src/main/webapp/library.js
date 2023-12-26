/**
 * library.js
 */
function inputs(userName, bookName, type) {
  this.userName = userName;
  this.bookName = bookName;
  this.type = type;
}

class Display {
  constructor() {}
  add(arrayInputs) {
    let tableBody = document.getElementById("table-body");
    let today = new Date().toLocaleDateString();
    let htmltobeadded = "";
    for (let i = 0; i < arrayInputs.length; i++) {
      htmltobeadded += `
                  <tr>
                    <td>${i + 1}</td>
                    <td>${today}</td>
                    <td>${arrayInputs[i].userName}</td>
                    <td>${arrayInputs[i].bookName}</td>
                    <td>${arrayInputs[i].type}</td>
                    <td> <button type="button" onclick = "deleteItem(${i})" class ="dlt-btn btn-primary btn " id ="dlt-btn"> Delete </button> </td>
                  </tr>
              `;
    }
    tableBody.innerHTML = htmltobeadded;
  }
  clear() {
    let myForm = document.getElementById("mylibraryform");
    myForm.reset();
  }
  validate(inputs) {
    if (inputs.userName == "" || inputs.bookName == "") {
      return false;
    } else return true;
  }
  alertuser(type, sub, massage) {
    let alertuser = document.getElementById("alertuser");
    let htmltobeaddedinalert = ` <div class="alert alert-${type} alert-dismissible fade show" id="alert" role="alert" >
      <strong>${sub}</strong> ${massage}
      <button type="button" class="close"  data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">×</span>
      </button>
    </div>`;
    alertuser.innerHTML += htmltobeaddedinalert;
    setTimeout(() => {
      alertuser.innerHTML = "";
    }, 4000);
  }

  checkIssue(listArray, o1) {
    for (let i = 0; i < listArray.length; i++) {
      if (listArray[i].bookName == o1.bookName) {
          this.issuedUser = listArray[i].userName;
        return 0;
      }
    }
    return 1;
  }
}

let listArray = [];

function showList() {
  new Display().add(listArray);
}
showList();

function deleteItem(index) {
  listArray.splice(index, 1);
  showList();
}

const form = document.getElementById("mylibraryform");
form.addEventListener("submit", formSubmit);
function formSubmit(e) {
  e.preventDefault();
  let givenUserName = document.getElementById("User-Name").value;
  let givenBookName = document.getElementById("Book-Name").value;
  let givenType;
  let checkFiction = document.getElementById("Fiction");
  let checkPrograming = document.getElementById("Programing");
  let checkcooking = document.getElementById("Cooking");
  if (checkFiction.checked) {
    givenType = checkFiction.value;
  } else if (checkPrograming.checked) {
    givenType = checkPrograming.value;
  } else {
    givenType = checkcooking.value;
  }

  let o1 = new inputs(givenUserName, givenBookName, givenType);

  let displayObj = new Display();
  if (displayObj.validate(o1) && displayObj.checkIssue(listArray, o1) == 1) {
    listArray.push(o1);
    new Display().add(listArray);
    displayObj.clear();
    displayObj.alertuser("success", "Success", "Book is issued");
  } else if (displayObj.checkIssue(listArray, o1) == 0) {
    displayObj.alertuser(
      "danger",
      "Oops!",
      `Book is already issued by ${displayObj.issuedUser}`
    );
    displayObj.clear();
  } else {
    displayObj.alertuser("danger", "Oops!", "Book is not issued");
    displayObj.clear();
  }
}
