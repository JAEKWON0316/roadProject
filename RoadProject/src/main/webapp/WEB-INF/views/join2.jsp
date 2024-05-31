<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/join.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="resources/js/jquery.min.js"></script>        
<script src="resources/js/script.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div id="container">
        <div class="step">
            <p>회원가입</p>
                <div class="step-indicator">
                    <div class="step-item active">유형 선택</div>
                    <div class="step-item active">정보 입력</div>
                    <div class="step-item">가입 완료</div>
                </div>
            </div>
            <div class="textbox2">
                <span>사업자 인증이 완료되었습니다.</span>
                <span>스페이스에 대한 자세한 정보 설정은 회원가입 후에 가능합니다.</span>
            </div>
             <div class="lineBox"></div>
            <div class="joinformBox">
                <form action="#" method="post">
                    <div class="formbox">
                        <label>닉네임<span>*</span></label>
                        <div>
                        <input type="text" name="nick" id="usernick" placeholder="{가게이름}">
                        </div>
                    </div>
                    <div class="formbox">
                        <label>아이디<span>*</span></label>
                        <div>
                        <input type="text" name="id" id="userid" placeholder="아이디 입력">
                        <button class="btn btn-danger">중복 확인</button>
                        </div>
                    </div>
                    <div class="formbox">
                        <label>비밀번호<span>*</span></label>
                        <div>
                        <input type="password" name="pass1" id="userpass1" placeholder="영문/숫자/특수문자 포함 8자 이상 16자 미만">
                        </div>
                    </div>
                    <div class="formbox">
                        <label>비밀번호 확인<span>*</span></label>
                        <div>
                        <input type="password" name="pass2" id="userpass2" placeholder="비밀번호를 한번 더 입력">
                        </div>
                    </div>
                    <div class="formbox2">
                        <label>주소<span>*</span></label>
                        <div>
                        <input type="text" name="addr1" id="useraddr1" placeholder="주소 입력">
                        <button class="btn btn-danger">주소 검색</button>
                        </div>
                        <div>
                        <input type="text" name="addr2" id="useraddr2" placeholder="상세 주소 입력">
                        </div>
                    </div>  
                    <div class="formbox">
                        <label>전화번호<span>*</span></label>
                        <div>
                        <input type="text" name="phone" id="userphone" placeholder="(-) 제외 번호 입력">
                        </div>
                    </div>
    </div>
        <div id="secondaryBox">
            <button type="submit" id="join_nextbtn" class="btn btn-secondary">다음으로</button>
        </div>
    </div>
</form>