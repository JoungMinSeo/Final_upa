<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="${pageContext.request.contextPath}/resources/js/card.js" defer></script> <!-- defer키워드 넣는 이유: 모든 스크립트 파일을 받을때까지 html창이 표시되지 않음을 방지하기 위해 -->

    <title>card~~~~</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/card.css">


</head>

<body>

    <div class="container">
        <div class="addCard font" onclick="addCard();"> 카드 추가하기</div>
    </div>


    <!-- 리스트 추가  modal -->

    <div class="modal fade modalList" id="addList" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl listSize">
            <div class="modal-content listmodal">
                <div class="modal-header">
                    <input class="lName font" type="text" placeholder="리스트이름" name="listNm"></input>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="profile">

                        <span class="profileMem font"> 참여 멤버 </span>

                        <div class="pofileImg">

                        </div>

                        <button type="button" class="btn btn-primary font addMember" data-toggle="modal"
                            data-target="#addMember">
                            일할 도롱뇽 추가
                        </button>

                    </div>

                    <div class="startDate">
                        <span class="font listStart"> 시작날짜 </span>
                        <input class="font listStartDt" type="datetime-local" name="listStartDt">
                    </div>

                    <div class="endDate">
                        <span class="font listEnd"> 마감날짜 </span>
                        <input class="font listEndDt" type="datetime-local" name="listEndDt">
                    </div>

                    <div class="listStatus">
                        <span class="font status"> 상태 </span>

                        <select class="form-select form-select-lg mb-3 font statusCategory">
                            <option selected class="font">하는 중</option>
                            <option value="1" class="font">해야할 일</option>
                            <option value="2" class="font">막힘</option>
                            <option value="3" class="font">완료</option>
                        </select>
                    </div>

                    <div class="file">

                        <span class="font addfilen">파일 추가</span>

                        <label class="btn btn-file border font fileLabel">
                            파일추가 <input type="file" class="fileNone">
                        </label>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary font" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary font createList" onclick="createList();">리스트 추가하기</button>
                </div>
            </div>
        </div>
    </div>


     <!-- 멤버 추가 모달 -->
     <div class="modal fade modalMember" id="addMember" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
             <div class="modal-header">
                 <h5 class="modal-title font" id="exampleModalLabel">모여라 도롱뇽 칭구들</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <span class="font">멤버1 </span> <span class="font">이메일 </span> <button type="button"
                     class="btn btn-primary addmem font">추가하기</button> <br>
                 <span class="font">멤버1 </span> <span class="font">이메일 </span> <button type="button"
                     class="btn btn-primary addmem font">추가하기</button> <br>
                 <span class="font">멤버1 </span> <span class="font">이메일 </span> <button type="button"
                     class="btn btn-primary addmem font">추가하기</button> <br>
                 <span class="font">멤버1 </span> <span class="font">이메일 </span> <button type="button"
                     class="btn btn-primary addmem font">추가하기</button> <br>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn btn-secondary font" data-dismiss="modal">취소</button>
                 <button type="button" class="btn btn-primary font">도롱뇽 추가</button>
             </div>
         </div>
     </div>
 </div>






</body>

</html>