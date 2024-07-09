#!/bin/bash

# 작업할 디렉토리로 이동
cd $1

# Git 상태 확인
git status

# 모든 변경사항 스테이지
git add .

# 커밋 메시지 작성
COMMIT_MESSAGE="Automated commit on $(date +\%Y-\%m-\%d \%H:\%M:\%S)"

# 커밋 수행
git commit -m "$COMMIT_MESSAGE"

# 원격 저장소에 push
git push origin main
