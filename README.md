# NanumGothic Font Installer for AWS SageMaker
notebook 한글 font

### 실행권한 부여
    chmod +x install_nanumfont.sh

### 스크립트 실행
    ./install_nanumfont.sh

### Jupyter Notebook에서 한글 폰트 설정
    from matplotlib import rcParams
    
    # 한글 폰트 설정
    rcParams['font.family'] = 'NanumGothic'
