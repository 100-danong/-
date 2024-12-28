<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Ending Credits</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            position: relative; /* 버튼 위치 조정을 위해 relative 추가 */
        }

        .credits {
            position: absolute;
            bottom: -100%;
            width: 100%;
            text-align: center;
            animation: scrollCredits 15s linear forwards; /* 애니메이션이 끝난 후 상태를 유지하기 위해 forwards 사용 */
        }

        @keyframes scrollCredits {
            0% {
                bottom: -100%;
            }
            100% {
                bottom: 100%;
            }
        }

        #stageButton {
            display: none; /* 애니메이션이 끝날 때까지 버튼 숨기기 */
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 10px 20px;
            font-size: 18px;
            background-color: #0095DD;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #stageButton:hover {
            background-color: #007bb5;
        }
    </style>
</head>
<body>
    <div class="credits" id="credits">
        <h1>벽돌깨기 스와이프</h1>
        <p>플레이해주셔서 감사합니다!</p>
        <p>Game Developer: 조종찬</p>
        <p>Graphics Designer: 조종찬</p>
        <p>Special Thanks: 김성훈 선생님</p>
        <p>And You!</p>
        <p><br/></p>
        <p><br/></p>
        <p><a href="HIDDENMAP5.jsp">GuGyeongGGun: 도제반 일동</a></p>
        <p>Special: We are the one!</p>
        <p>bangGwaGoo: GaeSiReo</p>
        <p>Youtuber: Jogyul</p>
        <p>Special Guest: 0828</p>
        <p>Masimac: Thank you Very So March!!</p>
        <p><br/></p>
        <p><br/></p>
        <p>설효림은 신이야</p>
        <p>박동도 신이야</p>
        <p>너네도 할 수 있어</p>
        <p>우리 가면 이젠 너네가 왕이야</p>
        <p><a href="HIDDENMAP3.jsp">공파리파 잘생김</a></p>
        <p>어쨌든 감사요</p>
    </div>
    <button id="stageButton" onclick="bu()">스테이지</button>

    <script>
        // 애니메이션이 끝날 때 실행되는 이벤트 리스너 추가
        const credits = document.getElementById('credits');
        const stageButton = document.getElementById('stageButton');

        credits.addEventListener('animationend', () => {
            stageButton.style.display = 'block'; // 애니메이션이 끝나면 버튼 표시
        });

        function bu() {
			window.location.href = "stage.jsp";
        }
    </script>
</body>
</html>



