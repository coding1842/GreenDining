<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/auth/Login.css" />
<h1 id="title">로그인/회원가입</h1>
<form action="/auth/loginProc" method="post">
  <div class="login_Box">
    <div id="kakao" onclick="kakaoLogin();">
      <a href="javascript:void(0)"><img alt="카카오" src="../image/kakao_login_medium_wide.png" /></a>
    </div>

    <!-- 			<ul> -->
    <!-- 	</li> -->
    <!-- 	<li onclick="kakaoLogout();"> -->
    <!--       <a href="javascript:void(0)"> -->
    <!--           <span>카카오 로그아웃</span> -->
    <!--       </a> -->
    <!-- 	</li> -->
    <!-- </ul> -->
    <!-- 카카오 스크립트 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
      Kakao.init("6dbff2fd1ac2e1ba6e38025d2fcdeced"); //발급받은 키 중 javascript키를 사용해준다.
      console.log(Kakao.isInitialized()); // sdk초기화여부판단
      //카카오로그인
      function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response) {
            Kakao.API.request({
              url: "/v2/user/me",
              success: function (response) {
                console.log(response);
              },
              fail: function (error) {
                console.log(error);
              },
            });
          },
          fail: function (error) {
            console.log(error);
          },
        });
      }
      //카카오로그아웃
      function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: "/v1/user/unlink",
            success: function (response) {
              console.log(response);
            },
            fail: function (error) {
              console.log(error);
            },
          });
          Kakao.Auth.setAccessToken(undefined);
        }
      }
    </script>

    <div id="ngf">
      <a id="naverIdLogin_loginButton" href="javascript:void(0)"><img alt="naver" src="../image/naver_icon2.png" width="40px" height="40px" /></a>

      <!-- 				<ul> -->
      <!-- 	<li onclick="naverLogout(); return false;"> -->
      <!--       <a href="javascript:void(0)"> -->
      <!--           <span>네이버 로그아웃</span> -->
      <!--       </a> -->
      <!-- 	</li> -->
      <!-- </ul> -->

      <!-- 네이버 스크립트 -->
      <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

      <script>
        var naverLogin = new naver.LoginWithNaverId({
          clientId: "KLCCCiQiyblMBC0XRkfH", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
          callbackUrl: "http://localhost:9000/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
          isPopup: false,
          callbackHandle: true,
        });

        naverLogin.init();

        window.addEventListener("load", function () {
          naverLogin.getLoginStatus(function (status) {
            if (status) {
              var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

              console.log(naverLogin.user);

              if (email == undefined || email == null) {
                alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                naverLogin.reprompt();
                return;
              }
            } else {
              console.log("callback 처리에 실패하였습니다.");
            }
          });
        });

        var testPopUp;
        function openPopUp() {
          testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
        }
        function closePopUp() {
          testPopUp.close();
        }

        function naverLogout() {
          openPopUp();
          setTimeout(function () {
            closePopUp();
          }, 1000);
        }
      </script>

      <a href=""><img alt="google" src="../image/google_logo_2_littledeep.png" width="40px" height="40px" /></a>
      <a href=""><img alt="facebook" src="../image/facebook2-icon-file.png" width="40px" height="40px" /></a>
    </div>
    <div id="login_inp">
      <input type="text" title="이이디" name="id" placeholder="아이디" />
      <input type="password" title="비밀번호" name="password" placeholder="비밀번호" />
    </div>
    <div id="check"><input type="checkbox" />로그인 상태 유지(미완성)</div>
    <section id="submitTop">
      <div id="login_btn">
        <button class="log_but" type="submit">로그인</button>
      </div>
    </section>
    <div>
      <p><a href="/auth/find-id">아이디</a>/<a href="/auth/find-pw">비밀번호 찾기(미완성)</a>&nbsp; <a href="/auth/sign-up">회원가입</a></p>
    </div>
  </div>
</form>
