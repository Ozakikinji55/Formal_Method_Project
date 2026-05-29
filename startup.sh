#!/bin/bash

# 1. 初始化 Conda 路径 (根据你的 Mac 安装位置，通常是 anaconda3)
# 如果这行报错，请确认你的 conda.sh 路径
source ~/anaconda3/etc/profile.d/conda.sh

# 2. 创建并激活环境
echo "🚀 正在创建环境: Angela (Python 3.9)..."
conda create -n Angela python=3.9 -y
conda activate Angela

# 3. 安装依赖
echo "📦 正在安装 requirements.txt 中的依赖..."
pip install --upgrade pip
pip install "numpy>=1.22,<1.24"
pip install -r requirements.txt

# 4. 补全离线模型数据
echo "🧠 正在下载 NLP 模型和 NLTK 资源..."
python -m spacy download en_core_web_sm
python -c "import nltk; nltk.download(['punkt', 'punkt_tab', 'averaged_perceptron_tagger', 'averaged_perceptron_tagger_eng', 'universal_tagset'])"

# 5. 注册 Jupyter 内核 (环境名和显示名统一)
echo "🖥️ 正在将 Angela 环境关联到 Jupyter..."
pip install ipykernel
python -m ipykernel install --user --name Angela --display-name "Python (Angela)"

echo "✨ 全部准备就绪！请重启 Jupyter 并选择 'Python (Angela)' 内核。"