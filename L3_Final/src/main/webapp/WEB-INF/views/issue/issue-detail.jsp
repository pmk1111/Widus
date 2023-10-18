<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en"class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default"
      data-assets-path="../resources/mainboard/assets/" data-template="vertical-menu-template-free">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" 
    	  content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <title>WidUs - 이슈 상세보기</title>
    <meta name="description" content="" />
    
    <!-- JQuery cdn -->
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
		<!-- css template -->
		<jsp:include page="../template/cssTemplate.jsp"></jsp:include>    
    
    <!-- issue-detail CSS -->
    <link rel="stylesheet" href="../resources/issue/css/issue-detail.css">
    <link rel="stylesheet" href="../resources/issue/css/issue-edit.css">
    <link rel="stylesheet" href="../resources/issue/css/statusChange.css">
    

    <style>
      .leftbar-close{background-color: #9F7AB0; border-radius: 50%;}
      pre{font-family: var(--bs-body-font-family) !important}
      
      
      
      .upload-file-content{display:flex; align-items:center; margin: 15px 0px; width: 100%; height: 60px; border:1.4px solid #d9dee3; border-radius: 5px; padding:0 10px}
      .file-item{margin:10px 0;}
      .file-item{border-style:none; background-color: white}
      .extension-icon{width:30px;}
    </style>
  </head>

  <body>
  	<input type="hidden" name="num" value="${param.num}"  id="issue_id">
  
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

  		<jsp:include page="../mainboard/leftbar.jsp"></jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

        <jsp:include page="../mainboard/navbar.jsp"></jsp:include>

         <!-- Content wrapper -->
        <div class="content-wrapper">
          <!-- Content -->

          <div class="container-xxl flex-grow-1 container-p-y">
            <div class="row">

              <!-- Total Revenue -->
              <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4 issue-detail">
                <div class="card">

                  <div class="card-body issue-card">
                    <div class="issue-location">
                      프로젝트 / 테스트 프로젝트 / ${issuedata.subject}
                    </div>
                    <hr class="issue-hr">

                    <div class="issue-write-info">
                    	<div class="issue-writer-date">
                      	<img src="../resources/mainboard/assets/img/avatars/1.png" alt class="w-px-40 h-auto user-img" />
                      	<span class="issue-writer">${issuedata.create_user}</span> <sup class="issue-create">${issuedata.created_at}</sup>
                      </div>
                      
                      
                     <div class="issue-option">
                      <img src="../resources/issue/img/settings.svg" class="issue-setting-icon">
                      
                      <ul class="issue-setting-dropdown">
                      	<li class="issue-dropdown-item copy-url">
                      		<img src="../resources/issue/img/copyurl.svg" class="issue-setting-icon link-copy-icon">
                      		<span>링크 복사</span>
                      	</li>
                      	
                      	<li class="issue-dropdown-item issue-edit">
                      		<img src="../resources/issue/img/edit.svg" class="issue-setting-icon edit-icon">
                      		<span>수정</span>
                      	</li>
                      	
                      	<li class="issue-dropdown-item issue-delete">
                      		<img src="../resources/issue/img/trash.svg" class="issue-setting-icon delete-icon">
                      		<span>삭제</span>
                      	</li>
                      </ul>
                      </div>
                      
                      
                    </div>
                    <h3 class="issue-title">${issuedata.subject }</h3>
                    <hr class="issue-hr">

                    <div class="issue-info">
                      <div class="issue-status-area">
                        <span>상태</span>
                        <div class="status-select">
                        	<input type="hidden" class="this-status" value="${issuedata.status}">
                          <button type="button" class="status-btn" data-value="To Do">To Do</button>
                          <button type="button" class="status-btn" data-value="In Progress">In Progress</button>
                          <button type="button" class="status-btn" data-value="Resolved">Resolved</button>
                          <button type="button" class="status-btn" data-value="Done">Done</button>
                        </div>
                      </div>
                      <div class="issue-assigned-area">
                        <span>담당자</span><span class="issue-assigned">${issuedata.assigned}</span>
                      </div>
                      <hr class="issue-hr">

                      <div class="issue-content" >
                   <!--      프로젝트란,<br>
                        부서 또는 업무 주제별 공간을 만들어 구성원을 초대하여 소통하는 '업무 소통 방' 입니다.<br>
                        <br>
                        혹시.. 프로젝트를 어떻게 세팅을 해야 할지 몰라서 프로젝트 만들기를 미루고 있으신가요?<br>
                        플로우를 만들고 있는 마드라스체크 직원들은 5단계 프로세스가 정착되어 있어,<br>
                        신입 직원이더라도 누구나 쉽게, 그리고 일관된 규칙으로 프로젝트를 만들고 세팅하고 있답니다.<br>
                        <br>
                        아래의 포인트를 생각하며 프로젝트를 만들고, 주기적으로 점검해 주세요!<br>
                        <br>
                        ✅ 프로젝트 제목은 직관적으로 만들었나요?<br>
                        ✅ 프로젝트 옵션 설정은 잘 되어있나요?<br>
                        ✅ 이 프로젝트는 어떤 프로젝트인지, 어떤 규칙이 있는지 운영방법이 공유되어 있나요?<br>
                        ✅ 업무와 관련된 참여자를 모두 초대했나요?<br>
                        ✅ 프로젝트 관리자로 추가 지정할 사람은 없나요?<br>
                        <br>
                        프로젝트 규칙 만드는 Tip 영상으로 확인하기 ▶ https://youtu.be/DwgWSLsLgpU -->
                        <pre>${issuedata.content}</pre>
                      </div>
                     <!--  <hr class="issue-hr"> -->
											
											<p>첨부파일</p>
                      <div class="issue-file-area">
                        	<c:choose>
													<c:when test="${empty filelist}">
														<h3></h3>
													</c:when>
													<c:otherwise>
														<c:forEach var="f" items="${filelist}">
														<div class="upload-file-content">
															<form method="get" action="down">
																<input type="hidden" value="${f.save_name}" name="saveName">
																<input type="hidden" value="${f.original_name}" name="originalName">
																
																<c:set var="split" value="${fn:split(f.original_name, '.')}"/>
																<c:set var="extension" value="${fn:toLowerCase(split[fn:length(split) - 1])}"/>
																																
																<c:choose>
    															<c:when test="${extension eq 'txt'}">
        														<img class="extension-icon" src="../resources/issue/img/txt-icon.png" alt="Text Icon">
    															</c:when>
    															<c:when test="${extension eq 'jpg' || extension eq 'jpeg' || extension eq 'png' || extension eq 'gif' || extension eq 'svg' || extension eq 'bmp'}">
        														<img class="extension-icon" src="../resources/issue/img/img-icon.png" alt="IMG Icon">
    															</c:when>
   																<c:when test="${extension eq 'xlsx' || extension eq 'xlsm' || extension eq 'xls' || extension eq 'xlsb' || extension eq 'xltx'}">
   																	<img class="extension-icon" src="../resources/issue/img/exel-icon.png" alt="exel Icon">
   																</c:when>
   																<c:when test="${extension eq 'hwp'}">
   																	<img class="extension-icon" src="../resources/issue/img/hwp-icon.png" alt="hwp Icon">
   																</c:when>
   																<c:when test="${extension eq 'pptx' || extension eq 'pptm' || extension eq 'ppt'}">
   																	<img class="extension-icon" src="../resources/issue/img/ppt-icon.png" alt="ppt Icon">
   																</c:when>
   																<c:when test="${extension eq 'pdf'}">
   																	<img class="extension-icon" src="../resources/issue/img/pdf-icon.png" alt="pdf Icon">
   																</c:when>
   																
    															<c:otherwise>
        														<img class="extension-icon" src="../resources/issue/img/default-icon.png" alt="Default Icon">
    															</c:otherwise>
																</c:choose>	
																
																<input type="submit" class="file-item" data-value="${f.id}" value="${f.original_name}"> 
															</form>
															</div>
														</c:forEach>
													</c:otherwise>
												</c:choose>
                      </div>
                      
                  <!--     <div class="subtask-wrap">
                        <span class="subtask-text">관련이슈</span>
                        <button type="button" class="add-subtask-btn"><img
                            src="../resources/issue/img/plus.svg">이슈추가</button>
                      </div>subtask-wrap end
                      <div class="subtask">
                        <div class="subtask-item">
                          <div class="subtask-status">In Progress</div>
                          <p class="subtask-title">채팅 기능 추가</p>
                        </div>
                      </div>  -->
                      <!-- subtask end-->

                    </div> <!-- issue-info end -->


                  </div> <!-- issue-card end -->

                  <div class="card comment-card">
                    <hr style="color: rgb(162, 162, 162); margin-bottom: 0px;">
                    <div class="comment-wrap">

                      <div class="comments create-comment" style="border-bottom: 1px solid lightgrey">
                        <img src="../resources/mainboard/assets/img/avatars/1.png" class="w-px-40 h-auto comment-writer-img" />
                        <div class="comment-input-submit">
                        	<textarea id="comment-textarea" class="comment-input" name="content" maxlength="500" rows="10" cols="50"
                          	placeholder="댓글 내용을 입력하세요."></textarea>
                        	<button type="button" class="comment-submit-btn">댓글 작성</button>
												</div>
                      </div> <!-- create-comment end -->
                      
                      <div class="comment-list">
                      </div>
                      
                    </div> <!-- comment-wrap end -->
                  </div>
                </div>
              </div>
            </div>
            <!--/ Total Revenue -->
            <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
              <div class="row">
              </div>
            </div>
          </div>
          <div class="row">


          </div>          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->

	</div>
      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
	</div> <!-- Layout-Wrapper end -->
	
<jsp:include page="issue-edit.jsp"></jsp:include>

<div class="issue-delete-modal">
	<div class="issue-delete-modal-overlay"></div>
	<div class="issue-delete-modal-content">
		<h4>정말 삭제하시겠습니까?</h4>
		<div class="issue-delete-btn-wrap">
			<button type="button" class="issue-delete-btn">삭제</button>
			<button type="button" class="delete-cancel-btn">취소</button>
		</div>
	</div>
</div>


<div class="status-update-modal">
	<div class="status-update-modal-overlay"></div>
	<div class="status-update-modal-content">
		<h4>상태를 변경하시겠습니까?</h4>
		<p class=status-change-text>상태를 변경하시려면 확인을 눌러주세요</p>
		<div class="status-update-modal-btn-wrap">
			<button type="button" class="status-update-modal-btn">확인</button>
			<button type="button" class="update-cancel-btn">취소</button>
		</div>
	</div>
</div>

<div class="status-update-modal-resolved">
	<div class="status-update-modal-overlay"></div>
	<div class="status-update-modal-content">
		<h4>상태를 변경하시겠습니까?</h4>
		<p class=status-change-text>상태를 변경하시려면 담당자 선택 후 확인을 눌러주세요</p>
		<input type="text" class="choose-assigner">
		<input type="hidden" class="choose-assignerrr" name="issue_assigned_name">
		<input type="hidden" class="selected-assigner-id" name="issue_assigned_id">
		<ul class="select-assign-dropdown">
			<li class="assign-dropdown-item">
				<div>
					<img src="../resources/mainboard/assets/img/avatars/1.png" alt class="h-auto user-img" />
					<span class="user-name">직원 1</span>
				</div>
				<span class="user-id">@1</span>
			</li>
			<li class="assign-dropdown-item">
				<div>
					<img src="../resources/mainboard/assets/img/avatars/1.png" class="h-auto user-img" />
					<span class="user-name">직원 2</span>
				</div>
				<span class="user-id">@2</span>
			</li>
			<li class="assign-dropdown-item">
				<div>
					<img src="../resources/mainboard/assets/img/avatars/1.png" class="h-auto user-img" />
					<span class="user-name">직원 3</span>
				</div>
				<span class="user-id">@3</span>
			</li>
			<!-- 나중에 해당 프로젝트에 참여 중인 사용자를 불러온다. -->
		</ul>
		<div class="status-update-modal-btn-wrap">
			<button type="button" class="status-update-modal-btn">확인</button>
			<button type="button" class="update-cancel-btn">취소</button>
		</div>
	</div>
</div>


  	<!-- js template -->
	<jsp:include page="../template/jsTemplate.jsp"></jsp:include>
    
    <!-- issuedetail & comment.js -->
  <script src="../resources/issue/js/issuedetail.js"></script>  
	<script src="../resources/issue/js/comment.js"></script>
	<script src="../resources/issue/js/issueEdit.js"></script>


<script type="text/javascript">
const existingFileNames = [];
$('.file-item').each(function() {
    existingFileNames.push($(this).val());
});
console.log('현재 첨부된 파일 목록:', existingFileNames);

$('.add-file').on('change', function() {
   
  // 새로운 파일 목록을 가져옴
    const newFileNames = [];
    const files = this.files;
    for (let i = 0; i < files.length; i++) {
        newFileNames.push(files[i].name);
    }

    // 새로운 파일 목록을 콘솔에 출력
    console.log('새로운 파일 목록:', newFileNames);

    // 첨부된 파일과 기존 파일 목록을 비교하여 변경 여부 확인
    const hasFileNameChanged = !arraysEqual(newFileNames, existingFileNames);

    if (hasFileNameChanged) {
        $('.check-file-changed').val('true');
    } else {
        $('.check-file-changed').val('false');
    }
});

// 배열 비교 함수
function arraysEqual(arr1, arr2) {
    if (arr1.length !== arr2.length) return false;
    for (let i = 0; i < arr1.length; i++) {
        if (arr1[i] !== arr2[i]) return false;
    }
    return true;
}


</script>
  </body>
</html>