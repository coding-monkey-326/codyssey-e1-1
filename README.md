# AI/SW 개발 워크스테이션 구축

## 1. 프로젝트 개요

터미널(Linux CLI), Docker, Git/GitHub 세 가지 핵심 도구를 직접 세팅하고 검증하는 미션입니다.
코드가 "내 컴퓨터에서만" 돌아가는 문제를 줄이고, 팀원 누구나 같은 방식으로 실행/배포/디버깅할 수 있는 환경 구성을 목표로 합니다.

---

## 2. 실행 환경

| 항목 | 내용 |
|------|------|
| OS | macOS (Darwin 24.6.0, x86_64) |
| Shell | zsh |
| Terminal | zsh |
| Docker | 28.5.2 |
| Git | 2.53.0 |

---

## 3. 수행 항목 체크리스트

- [ ] 터미널 기본 조작 및 폴더 구성
- [ ] 권한 변경 실습
- [ ] Docker 설치/점검
- [ ] hello-world 실행
- [ ] 이미지/컨테이너 목록 확인 및 정리
- [ ] Dockerfile 빌드/실행
- [ ] 포트 매핑 접속
- [ ] 바인드 마운트 반영
- [ ] 볼륨 영속성 검증
- [ ] Git 설정 + GitHub 연동

---

## 4. 터미널 조작 로그

### 4-1. 기본 명령어

```bash
# 현재 위치 확인
$ pwd
/Users/sungminchoidev3025

# 목록 확인 (숨김 파일 포함)
$ ls -la
total 64
drwxr-x---+ 26 sungminchoidev3025  sungminchoidev3025    832 Mar 31 02:50 .
drwxr-xr-x   6 root                admin                 192 Mar 30 16:17 ..
-r--------   1 sungminchoidev3025  sungminchoidev3025      7 Mar 30 16:22 CFUserTextEncoding
-rw-r--r--@  1 sungminchoidev3025  sungminchoidev3025  10244 Mar 31 02:44 .DS_Store
drwx------+  2 sungminchoidev3025  sungminchoidev3025     64 Mar 31 00:47 .Trash
drwxr-xr-x   3 sungminchoidev3025  sungminchoidev3025     96 Mar 30 16:30 .config
drwxr-xr-x   5 sungminchoidev3025  sungminchoidev3025    160 Mar 30 16:18 .docker
-rw-r--r--   1 sungminchoidev3025  sungminchoidev3025     68 Mar 31 02:49 .gitconfig
-rw-------   1 sungminchoidev3025  sungminchoidev3025     20 Mar 31 02:49 .lesshst
drwxr-xr-x   3 sungminchoidev3025  sungminchoidev3025     96 Mar 31 02:46 .local
drwxr-xr-x  10 sungminchoidev3025  sungminchoidev3025    320 Mar 31 00:06 .orbstack
drwxr-xr-x   7 sungminchoidev3025  sungminchoidev3025    224 Mar 31 00:16 .ssh
-rw-------   1 sungminchoidev3025  sungminchoidev3025   1232 Mar 31 02:17 .viminfo
drwxr-xr-x   5 sungminchoidev3025  sungminchoidev3025    160 Mar 31 02:44 .vscode
-rw-------   1 sungminchoidev3025  sungminchoidev3025   1207 Mar 31 02:50 .zsh_history
drwx------  15 sungminchoidev3025  sungminchoidev3025    480 Mar 31 02:50 .zsh_sessions
drwx------+  7 sungminchoidev3025  sungminchoidev3025    224 Mar 31 00:44 Desktop
drwx------+  3 sungminchoidev3025  sungminchoidev3025     96 Mar 30 16:17 Documents
drwx------+  7 sungminchoidev3025  sungminchoidev3025    224 Mar 31 02:44 Downloads
drwx------@ 84 sungminchoidev3025  sungminchoidev3025   2688 Mar 31 00:47 Library
drwx------   3 sungminchoidev3025  sungminchoidev3025     96 Mar 30 16:17 Movies
drwx------+  3 sungminchoidev3025  sungminchoidev3025     96 Mar 30 16:17 Music
drwx------   4 sungminchoidev3025  sungminchoidev3025    160 Mar 31 02:36 OrbStack
drwx------+  4 sungminchoidev3025  sungminchoidev3025    128 Mar 30 16:17 Pictures
drwxr-xr-x+  4 sungminchoidev3025  sungminchoidev3025    128 Mar 30 16:17 Public
drwxr-xr-x   4 sungminchoidev3025  sungminchoidev3025    128 Mar 31 02:44 codyssey-e1-1

# 디렉토리 생성
$ mkdir -p ~/grandParent/parent/child
drwxr-xr-x   3 sungminchoidev3025  sungminchoidev3025     96 Mar 31 02:52 grandParent
$ ls -lR grandParent
total 0
drwxr-xr-x  3 sungminchoidev3025  sungminchoidev3025  96 Mar 31 02:52 parent

grandParent/parent:
total 0
drwxr-xr-x  2 sungminchoidev3025  sungminchoidev3025  64 Mar 31 02:52 child

grandParent/parent/child:
total 0

# 파일 생성
$ touch test.txt
-rw-r--r--   1 sungminchoidev3025  sungminchoidev3025     0 Mar 31 02:53 zero.txt

# 파일 내용 확인
$ cat test.txt


# 복사
$ cp test.txt test_copy.txt


# 이동/이름변경
$ mv test_copy.txt test_renamed.txt


# 삭제
$ rm test_renamed.txt

```

---

## 5. 권한 실습

### 5-1. 파일 권한 변경

```bash
# 변경 전
$ ls -l hello.sh
-rw-r--r--  1 sungminchoidev3025  sungminchoidev3025  35 Mar 31 02:55 hello.sh

# 권한 변경
$ chmod 755 hello.sh

# 변경 후
$ ls -l hello.sh
-rwxr-xr-x  1 sungminchoidev3025  sungminchoidev3025  35 Mar 31 02:55 hello.sh

```

### 5-2. 디렉토리 권한 변경

```bash
# 변경 전
$ ls -ld ~/d_permission
drwxr-xr-x   2 sungminchoidev3025  sungminchoidev3025    64 Mar 31 02:58 d_permission

# 권한 변경
$ chmod 644 ~/d_permission

# 변경 후
$ ls -ld ~/d_permission
drw-r--r--  2 sungminchoidev3025  sungminchoidev3025  64 Mar 31 02:58 /Users/sungminchoidev3025/d_permission

```

---

## 6. Docker 설치 및 기본 점검

```bash
# 버전 확인
$ docker --version
Docker version 28.5.2, build ecc6942

# 데몬 동작 확인
$ docker info
Client:
 Version:    28.5.2
 Context:    orbstack
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.29.1
    Path:     /Users/sungminchoidev3025/.docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.40.3
    Path:     /Users/sungminchoidev3025/.docker/cli-plugins/docker-compose

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 28.5.2
 Storage Driver: overlay2
  Backing Filesystem: btrfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc version: d842d7719497cc3b774fd71620278ac9e17710e0
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.17.8-orbstack-00308-g8f9c941121b1
 Operating System: OrbStack
 OSType: linux
 Architecture: x86_64
 CPUs: 6
 Total Memory: 15.67GiB
 Name: orbstack
 ID: 11ed3134-3a51-4e79-a78e-9f2cc25b0162
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false
 Product License: Community Engine
 Default Address Pools:
   Base: 192.168.97.0/24, Size: 24
   Base: 192.168.107.0/24, Size: 24
   Base: 192.168.117.0/24, Size: 24
   Base: 192.168.147.0/24, Size: 24
   Base: 192.168.148.0/24, Size: 24
   Base: 192.168.155.0/24, Size: 24
   Base: 192.168.156.0/24, Size: 24
   Base: 192.168.158.0/24, Size: 24
   Base: 192.168.163.0/24, Size: 24
   Base: 192.168.164.0/24, Size: 24
   Base: 192.168.165.0/24, Size: 24
   Base: 192.168.166.0/24, Size: 24
   Base: 192.168.167.0/24, Size: 24
   Base: 192.168.171.0/24, Size: 24
   Base: 192.168.172.0/24, Size: 24
   Base: 192.168.181.0/24, Size: 24
   Base: 192.168.183.0/24, Size: 24
   Base: 192.168.186.0/24, Size: 24
   Base: 192.168.207.0/24, Size: 24
   Base: 192.168.214.0/24, Size: 24
   Base: 192.168.215.0/24, Size: 24
   Base: 192.168.216.0/24, Size: 24
   Base: 192.168.223.0/24, Size: 24
   Base: 192.168.227.0/24, Size: 24
   Base: 192.168.228.0/24, Size: 24
   Base: 192.168.229.0/24, Size: 24
   Base: 192.168.237.0/24, Size: 24
   Base: 192.168.239.0/24, Size: 24
   Base: 192.168.242.0/24, Size: 24
   Base: 192.168.247.0/24, Size: 24
   Base: fd07:b51a:cc66:d000::/56, Size: 64

```

---

## 7. Docker 기본 운영 명령

```bash
# 이미지 목록
$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED      SIZE
nginx        latest    0cf1d6af5ca7   5 days ago   161MB

# 컨테이너 목록 (실행 중)
$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

# 컨테이너 목록 (전체)
$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS     NAMES
7fc853c7adf2   nginx     "/docker-entrypoint.…"   3 seconds ago   Up 2 seconds               80/tcp    nervous_cerf
7f3d8e5f4da6   nginx     "/docker-entrypoint.…"   9 seconds ago   Exited (0) 5 seconds ago             zen_merkle

# 로그 확인
$ docker logs <container_name>
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/03/30 18:04:16 [notice] 1#1: using the "epoll" event method
2026/03/30 18:04:16 [notice] 1#1: nginx/1.29.7
2026/03/30 18:04:16 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19)
2026/03/30 18:04:16 [notice] 1#1: OS: Linux 6.17.8-orbstack-00308-g8f9c941121b1
2026/03/30 18:04:16 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 20480:1048576
2026/03/30 18:04:16 [notice] 1#1: start worker processes
2026/03/30 18:04:16 [notice] 1#1: start worker process 29
2026/03/30 18:04:16 [notice] 1#1: start worker process 30
2026/03/30 18:04:16 [notice] 1#1: start worker process 31
2026/03/30 18:04:16 [notice] 1#1: start worker process 32
2026/03/30 18:04:16 [notice] 1#1: start worker process 33
2026/03/30 18:04:16 [notice] 1#1: start worker process 34

# 리소스 확인
$ docker stats
CONTAINER ID   NAME           CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O         PIDS
7fc853c7adf2   nervous_cerf   0.00%     6.477MiB / 15.67GiB   0.04%     1.13kB / 126B   11.5MB / 8.19kB   7

```

---

## 8. 컨테이너 실행 실습

### 8-1. hello-world 실행

```bash
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
4f55086f7dd0: Pull complete
Digest: sha256:452a468a4bf985040037cb6d5392410206e47db9bf5b7278d281f94d1c2d0931
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```

### 8-2. ubuntu 컨테이너 진입

```bash
$ docker run -it ubuntu bash

# 컨테이너 내부
$ ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr

$ echo "hello from container"
hello from container

```

### 8-3. attach vs exec 차이 정리

<!-- 직접 관찰 후 작성 -->

---

## 9. Dockerfile 기반 커스텀 이미지

### 9-1. 선택한 베이스 이미지

<!-- 예: nginx:alpine -->

### 9-2. 커스텀 포인트 및 목적

<!-- 각 지시어가 왜 필요한지 간단히 설명 -->

### 9-3. Dockerfile

```dockerfile
<!-- 작성 후 붙여넣기 -->
```

### 9-4. 빌드 및 실행

```bash
# 빌드
$ docker build -t my-web:1.0 .


# 실행
$ docker run -d -p 8080:80 --name my-web my-web:1.0

```

---

## 10. 포트 매핑 접속 증거

```bash
$ curl http://localhost:8080

```

<!-- 브라우저 스크린샷 첨부 (주소창 + 응답 화면) -->

---

## 11. 바인드 마운트 반영

```bash
# 실행
$ docker run -d -v $(pwd)/site:/usr/share/nginx/html -p 8081:80 --name bind-test my-web:1.0

# 호스트 파일 수정 전 확인
$ curl http://localhost:8081

# 호스트 파일 수정 후 확인
$ curl http://localhost:8081

```

---

## 12. Docker 볼륨 영속성 검증

```bash
# 볼륨 생성
$ docker volume create mydata

# 컨테이너 연결 및 데이터 쓰기
$ docker run -d --name vol-test -v mydata:/data ubuntu sleep infinity
$ docker exec -it vol-test bash -c "echo 'hello' > /data/test.txt && cat /data/test.txt"

# 컨테이너 삭제
$ docker rm -f vol-test

# 새 컨테이너로 데이터 유지 확인
$ docker run -d --name vol-test2 -v mydata:/data ubuntu sleep infinity
$ docker exec -it vol-test2 bash -c "cat /data/test.txt"

```

---

## 13. Git 설정 및 GitHub 연동

```bash
# 사용자 정보 설정
$ git config --global user.name "이름"
$ git config --global user.email "이메일"


# 설정 확인
$ git config --list

```

<!-- VSCode GitHub 연동 스크린샷 첨부 -->

---

## 14. 트러블슈팅

### Case 1.

| 항목 | 내용 |
|------|------|
| 문제 | |
| 원인 가설 | |
| 확인 | |
| 해결/대안 | |

### Case 2.

| 항목 | 내용 |
|------|------|
| 문제 | |
| 원인 가설 | |
| 해결/대안 | |

---

## 15. 디렉토리 구조

```
codyssey-e1-1/
├── README.md
├── Dockerfile
└── site/
    └── index.html
```

<!-- 구성 기준 설명: 왜 이렇게 나눴는지 -->

---

## 16. 검증 방법 요약

| 항목 | 검증 명령 | 결과 위치 |
|------|----------|----------|
| 터미널 조작 | `pwd`, `ls -la`, `mkdir` 등 | 4섹션 |
| 권한 변경 | `chmod`, `ls -l` | 5섹션 |
| Docker 점검 | `docker --version`, `docker info` | 6섹션 |
| hello-world | `docker run hello-world` | 8섹션 |
| 이미지 빌드 | `docker build` | 9섹션 |
| 포트 매핑 | `curl http://localhost:8080` | 10섹션 |
| 바인드 마운트 | 파일 수정 전/후 비교 | 11섹션 |
| 볼륨 영속성 | 컨테이너 삭제 전/후 비교 | 12섹션 |
| Git/GitHub | `git config --list` | 13섹션 |
