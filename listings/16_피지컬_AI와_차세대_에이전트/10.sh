# claude_vision_bot/detector_node.py (일부)
def image_callback(self, msg):
    # 1. ROS 이미지를 OpenCV 형식으로 변환 후 base64 인코딩
    cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
    _, buffer = cv2.imencode('.jpg', cv_image)
    image_b64 = base64.b64encode(buffer).decode('utf-8')

    # 2. Claude에게 시각 정보 분석 요청
    response = self.client.messages.create(
        model="claude-opus-5-5",
        max_tokens=1024,
        messages=[{
            "role": "user",
            "content": [
                {"type": "image", "source": {"type": "base64",
                 "media_type": "image/jpeg", "data": image_b64}},
                {"type": "text", "text": "화면에 보이는 모든 물체를 "
                                         "[이름, 위치] 리스트로 반환한다."}
            ]
        }]
    )

    # 3. 분석 결과를 다른 로봇 노드들에게 전파
    result_msg = String(data=response.content[0].text)
    self.publisher.publish(result_msg)
