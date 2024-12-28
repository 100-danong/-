<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 시작</title>
<!-- 부트스트랩 CSS 추가 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
    body {
        background-color: #f8f9fa;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .game-container {
        text-align: center;
    }
    canvas {
        background: #eee;
        margin-bottom: 20px;
        border: 2px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    button {
        display: inline-block;
        margin: 10px;
    }
</style>
</head>
<script type="text/javascript">
function bu() {
	window.location.href = "stage.jsp";
}
</script>
<body>


<div class="game-container">
    <canvas id="myCanvas" width="550" height="500"></canvas>
    <button id="runButton" class="btn btn-primary">게임 시작</button>
</div>

<script type="text/javascript">
    // 캔버스와 컨텍스트 가져오기
    const canvas = document.getElementById("myCanvas");
    const ctx = canvas.getContext("2d");
    
    
    
    // 공의 반지름
    const ballRadius = 5;

    // 공의 초기 위치
    let x = canvas.width / 2;
    let y = canvas.height - 30;

    // 공의 이동 속도
    let dx = 5;
    let dy = -5;

    // 패들의 높이와 너비
    const paddleHeight = 10;
    const paddleWidth = 100;

    // 패들의 초기 위치
    let paddleX = (canvas.width - paddleWidth) / 2;

    // 키 입력 상태
    let rightPressed = false;
    let leftPressed = false;

 // 벽돌 설정
    const brickRowCount = 9;        // 각 열에 있는 벽돌의 개수
    const brickColumnCount = 5;     // 각 행에 있는 벽돌의 개수
    const brickWidth = 50;          // 각 벽돌의 너비 (픽셀 단위)
    const brickHeight = 20;         // 각 벽돌의 높이 (픽셀 단위)
    const brickPadding = 7;        // 벽돌 사이의 간격 (픽셀 단위)
    const brickOffsetTop = 30;      // 첫 번째 벽돌이 시작하는 위치의 상단 여백 (캔버스의 상단으로부터 픽셀 단위)
    const brickOffsetLeft = 15;     // 첫 번째 벽돌이 시작하는 위치의 왼쪽 여백 (캔버스의 왼쪽으로부터 픽셀 단위)


    // 점수와 생명
    let score = 0;
    let lives = 3;

    // 벽돌 배열 초기화
    let bricks = [];
    for (let c = 0; c < brickColumnCount; c++) {
        bricks[c] = [];
        for (let r = 0; r < brickRowCount; r++) {
            bricks[c][r] = { x: 0, y: 0, status: 1 }; // status가 1이면 벽돌이 존재함
        }
    }

    // 키 다운 이벤트 핸들러
    document.addEventListener("keydown", keyDownHandler, false);
    // 키 업 이벤트 핸들러
    document.addEventListener("keyup", keyUpHandler, false);
    // 마우스 이동 이벤트 핸들러
    document.addEventListener("mousemove", mouseMoveHandler, false);

    function keyDownHandler(e) {
        if (e.key == "Right" || e.key == "ArrowRight") {
            rightPressed = true;
        } else if (e.key == "Left" || e.key == "ArrowLeft") {
            leftPressed = true;
        }
    }

    function keyUpHandler(e) {
        if (e.key == "Right" || e.key == "ArrowRight") {
            rightPressed = false;
        } else if (e.key == "Left" || e.key == "ArrowLeft") {
            leftPressed = false;
        }
    }

    function mouseMoveHandler(e) {
        let relativeX = e.clientX - canvas.offsetLeft;
        if (relativeX > 0 && relativeX < canvas.width) {
            paddleX = relativeX - paddleWidth / 2;
        }
    }

    // 벽돌과 공의 충돌 감지
    function collisionDetection() {
        for (let c = 0; c < brickColumnCount; c++) {
            for (let r = 0; r < brickRowCount; r++) {
                let b = bricks[c][r];
                if (b.status == 1) {
                    if (
                        x > b.x &&
                        x < b.x + brickWidth &&
                        y > b.y &&
                        y < b.y + brickHeight
                    ) {
                        dy = -dy;
                        b.status = 0;
                        score++;
                        if (score == brickRowCount * brickColumnCount) {
                            alert("당신은 히든 스테이지 0828를 클리어하였습니다.");
                            window.location.href = "hiddensuccess.jsp";
                        }
                    }
                }
            }
        }
    }

    // 공 그리기
    function drawBall() {
        ctx.beginPath();
        ctx.arc(x, y, ballRadius, 0, Math.PI * 2);
        ctx.fillStyle = "#0095DD";
        ctx.fill();
        ctx.closePath();
    }

    // 패들 그리기
    function drawPaddle() {
        ctx.beginPath();
        ctx.rect(paddleX, canvas.height - paddleHeight, paddleWidth, paddleHeight);
        ctx.fillStyle = "#0095DD";
        ctx.fill();
        ctx.closePath();
    }

    // 벽돌 그리기
    function drawBricks() {
        for (let c = 0; c < brickColumnCount; c++) {
            for (let r = 0; r < brickRowCount; r++) {
                if (bricks[c][r].status == 1) {
                    const brickX = r * (brickWidth + brickPadding) + brickOffsetLeft;
                    const brickY = c * (brickHeight + brickPadding) + brickOffsetTop;
                    bricks[c][r].x = brickX;
                    bricks[c][r].y = brickY;
                    ctx.beginPath();
                    ctx.rect(brickX, brickY, brickWidth, brickHeight);
                    ctx.fillStyle = "#0095DD";
                    ctx.fill();
                    ctx.closePath();
                }
            }
        }
    }

    // 점수 그리기
    function drawScore() {
        ctx.font = "16px Arial";
        ctx.fillStyle = "#0095DD";
        ctx.fillText("Score: " + score, 8, 20);
    }

    // 생명 그리기
    function drawLives() {
        ctx.font = "16px Arial";
        ctx.fillStyle = "#0095DD";
        ctx.fillText("Lives: " + lives, canvas.width - 65, 20);
    }

    // 전체 그리기 및 업데이트 함수
    function draw() {
    	const backgroundImage = new Image();
        backgroundImage.onload = function() {
            ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
        };
        backgroundImage.src = 'JPG/08283.jpg'; // 배경 이미지의 경로를 설정합니다.
        
        drawBricks();
        drawBall();
        drawPaddle();
        drawScore();
        drawLives();
        collisionDetection();

        // 공이 좌우 벽에 부딪히면 반사
        if (x + dx > canvas.width - ballRadius || x + dx < ballRadius) {
            dx = -dx;
        }
        // 공이 천장에 부딪히면 반사
        if (y + dy < ballRadius) {
            dy = -dy;
        } else if (y + dy > canvas.height - ballRadius) {
            // 공이 바닥에 부딪힐 경우
            if (x > paddleX && x < paddleX + paddleWidth) {
                dy = -dy;
            } else {
                lives--; // 생명 하나 감소
                if (!lives) {
                    alert("히든맵 속에서 허우적 거립니다...");
                    document.location.reload(); // 게임 재시작
                } else {
                    x = canvas.width / 2;
                    y = canvas.height - 30;
                    dx = 5;
                    dy = -5;
                    paddleX = (canvas.width - paddleWidth) / 2;
                }
            }
        }

        // 패들 이동
        if (rightPressed && paddleX < canvas.width - paddleWidth) {
            paddleX += 7;
        } else if (leftPressed && paddleX > 0) {
            paddleX -= 7;
        }

        // 공 이동
        x += dx;
        y += dy;
        requestAnimationFrame(draw);
    }

    // 버튼 클릭 이벤트 핸들러
    document.getElementById("runButton").addEventListener("click", function () {
        draw();
        this.disabled = true; // 버튼 비활성화
    });
</script>
</body>
</html>
