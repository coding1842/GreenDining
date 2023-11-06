<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
		<h1 id="title">�α���/ȸ������</h1>
		<div class="login_Box">
			<div id="kakao" onclick="kakaoLogin();">
				<a href="javascript:void(0)"><img alt="īī��" src="../image/kakao_login_medium_wide.png"></a>
			</div>
			
<!-- 			<ul> -->
<!-- 	</li> -->
<!-- 	<li onclick="kakaoLogout();"> -->
<!--       <a href="javascript:void(0)"> -->
<!--           <span>īī�� �α׾ƿ�</span> -->
<!--       </a> -->
<!-- 	</li> -->
<!-- </ul> -->
<!-- īī�� ��ũ��Ʈ -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('6dbff2fd1ac2e1ba6e38025d2fcdeced'); //�߱޹��� Ű �� javascriptŰ�� ������ش�.
console.log(Kakao.isInitialized()); // sdk�ʱ�ȭ�����Ǵ�
//īī���α���
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//īī���α׾ƿ�  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
			
			<div id="ngf">
				<a id="naverIdLogin_loginButton" href="javascript:void(0)"><img alt="naver" src="../image/naver_icon2.png" width="40px" height="40px"></a>
				
<!-- 				<ul> -->
<!-- 	<li onclick="naverLogout(); return false;"> -->
<!--       <a href="javascript:void(0)"> -->
<!--           <span>���̹� �α׾ƿ�</span> -->
<!--       </a> -->
<!-- 	</li> -->
<!-- </ul> -->

<!-- ���̹� ��ũ��Ʈ -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "KLCCCiQiyblMBC0XRkfH", //�� ���ø����̼� ������ cliendId�� �Է����ݴϴ�.
			callbackUrl: "http://localhost:9000/naverLogin", // �� ���ø����̼� API������ Callback URL �� �Է����ݴϴ�.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // �ʼ��� �����Ұ��� �޾ƿ� �Ʒ�ó�� ���ǹ��� �ݴϴ�.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("�̸����� �ʼ������Դϴ�. ���������� �������ּ���.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback ó���� �����Ͽ����ϴ�.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}
</script>
				
				<a href=""><img alt="google" src="../image/google_logo_2_littledeep.png" width="40px" height="40px"></a>
				<a href=""><img alt="facebook" src="../image/facebook2-icon-file.png" width="40px" height="40px"></a>
			</div>
			<div id="login_inp">
				<input type="text" title="���̵�" placeholder="���̵�">
				<input type="password" title="��й�ȣ" placeholder="��й�ȣ">
			</div>
			<div id="check">
				<input type="checkbox">�α��� ���� ����
			</div>
			<div id="login_btn">
				<button class="log_but" onclick="">�α���</button>
			</div>
			<div>
				<p><a href="/user/login/fing-id">���̵�</a>/<a href="/user/login/fing-password">��й�ȣ ã��</a>&nbsp;	<a href="/user/sign-up">ȸ������</a></p>
				
			</div>
		</div>
