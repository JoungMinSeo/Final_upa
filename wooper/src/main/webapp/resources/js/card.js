/* 드래그앤드랍 */
const fill = document.querySelector('.fill');
const empties = document.querySelectorAll('.empty');
const lists = document.querySelectorAll('.list');

// Fill Listeners
fill.addEventListener('dragstart', dragStart);
fill.addEventListener('dragend', dragEnd);

// Loop through empties and call drag events
for(const list of lists){
    list.addEventListener('dragover', dragOver);
    list.addEventListener('dragenter', dragEnter);
    list.addEventListener('dragleave', dragLeave);
    list.addEventListener('drop', dragDrop);
}


// Drag Functions
function dragStart(){
    moveFill = this;

    this.className += ' hold';
    setTimeout(()=>this.className = ' invisible', 0);
}

function dragEnd(){
    this.className = 'fill'; 

}

function dragOver(e){
    e.preventDefault();
}

function dragEnter(e){
    e.preventDefault();
    this.className += ' hovered';
}

function dragLeave(){
    this.className = 'list';
}

function dragDrop(){
    this.className = 'list';
    moveFill.className = 'fill';
    console.log(moveFill);
    this.append(moveFill);
}



/* 카드 추가하기 */
function addCard(){

    var empty = $("<div>").addClass("empty");

    var top = $("<div>").addClass("top");
    var name = $("<div>").addClass("name");
    var cardName = $("<input>").addClass("cardName").addClass("font").attr("placeholder","카드명").attr("onkeyup","if(window.event.keyCode==13){enter()}");

    var list = $("<div>").addClass("list"); 
    var br = $("<br>");

    $(list).on('dragover', dragOver);
    $(list).on('dragenter', dragEnter);
    $(list).on('dragleave', dragLeave);
    $(list).on('drop', dragDrop);

    var bottom = $("<div>").addClass("bottom");
    var addList = $("<button>").addClass("addList").addClass("btn").addClass("font").attr("data-toggle","modal").attr("data-target","#addList").text("리스트추가");
    var undo = $("<button>").addClass("undo").addClass("btn").addClass("font").text("x");

    name.append(cardName);
    top.append(name);
    list.append(br).append(br);
    bottom.append(addList).append(undo);
    empty.append(top).append(list).append(bottom);

    /* 카드 모양 완성 */
    $(".addCard").before(empty);
    cardName.focus();
    
} 

/* 엔터를 눌렀을때 카드추가*/
function enter(){
    addCard();
    /* this.nextSibling.getElementsByClassName(cardName).focus(); */
    /* this.blur; */
}


/* 리스트 생성할 시 */
function  createList(){



}

$(document).on("change", ".cardName", function(){
    console.log( $(this).val()  );
});