FROM nginx:alpine
 
# 이미지 메타데이터 설정
LABEL org.opencontainers.image.title="my-custom-nginx"
LABEL org.opencontainers.image.description="AI/SW 개발 워크스테이션 구축 미션 - 커스텀 nginx 이미지"
 
# 환경 변수 설정
ENV APP_ENV=dev
 
# 정적 콘텐츠 복사
COPY static/ /usr/share/nginx/html/
 
# 80번 포트 노출
EXPOSE 80