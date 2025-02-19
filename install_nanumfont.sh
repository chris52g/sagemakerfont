#!/bin/bash

CONDA_ENV_NAME="tabular310"

source /home/ec2-user/anaconda3/bin/activate "$CONDA_ENV_NAME"
echo "[O] Conda 환경 활성화됨: $(which python)"


FONT_DIR="$HOME/.fonts"
FONT_CACHE_DIR="$HOME/.cache/matplotlib"
FONT_NAME="NanumGothic"
FONT_URL="https://raw.githubusercontent.com/chris52g/sagemakerfont/main/Nanum_Gothic_Fonts.zip"
FONT_ZIP="Nanum_Gothic_Fonts.zip"

echo "[1] 시스템 폰트 설치 여부 확인..."
if fc-list | grep -i "$FONT_NAME" > /dev/null; then
    echo "[O] $FONT_NAME 폰트가 이미 설치되어 있습니다."
else
    echo "[X] $FONT_NAME 폰트가 설치되지 않았습니다. 설치를 시작합니다."

    # 폰트 다운로드 및 설치
    mkdir -p "$FONT_DIR"
    cd "$FONT_DIR"
    
    wget "$FONT_URL" -O "$FONT_ZIP"
    unzip -o "$FONT_ZIP"
    rm -f "$FONT_ZIP"

    # 폰트 캐시 업데이트
    fc-cache -fv

    echo "[O] $FONT_NAME 폰트가 성공적으로 설치되었습니다."
fi

echo "[2] matplotlib 캐시 삭제..."
rm -rf "$FONT_CACHE_DIR"

echo "[3] 설정 완료! 이제 Jupyter Notebook에서 'NanumGothic'을 사용할 수 있습니다."
