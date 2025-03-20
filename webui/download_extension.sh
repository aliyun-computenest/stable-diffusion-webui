#!/bin/bash

set -euo pipefail


function clone () {
      set +e ;
      git clone --depth=1 --no-tags --recurse-submodules --shallow-submodules "$1";
      set -e ;
}

cd /workspace/stable-diffusion-webui/extensions-builtin
## 中文输入自动转英文
   #自动保存使用描述词
   #一键收藏想要描述词
   #翻译接口超多种选择
   #-键粘贴删除描述词
#clone https://github.com/Physton/sd-webui-prompt-all-in-one.git
clone https://github.com/studyzy/sd-prompt-translator.git

clone https://github.com/mcmonkeyprojects/sd-dynamic-thresholding.git
# 扫描所有模型，从Civitai下载模型信息和预览图
  #通过civitai模型页面url，连接本地模型和civitai模型信息
  #通过Civitai模型页面url，下载模型(含信息和预览图)到SD目录或子目录。
  #下载支持断点续传
  #批量检查本地模型，在civitai上的新版本
  #直接下载新版本模型到SD模型目录内(含信息和预览图)
  #修改了内置的"Extra Network"模型卡片，每个卡片增加了如下功能按钮:
  #: 修改文字"replace preview"为这个图标
  #: 在新标签页打开这个模型的Civitai页面
  #: 一键添加这个模型的触发词到关键词输入框
  #: 一键使用这个模型预览图所使用的关键词
clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git
#Tiled Diffusion 可以用比较低的显存使用率超分 2K 以上的图片。在 highres.fix 达到 1.5 或 2 倍 CUDA 内存限制后，它可以集成到 Stable Diffusion 的图片超分工作流程。
 #
 #它支持将 Regional Prompt Control、ControlNet、DemoFusion 集成到工作流，使其灵活且方便地用于生产流程。
 #
 #参考 PotatCat 出的详细教程 (PDF)：https://civitai.com/models/34726
clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111.git
# Ultimate SD Upscale 插件可以帮助你实现更高的分辨率，尤其当 highres.fix 出现 cuda 内存不足或无法实现更大图片尺寸的时候。推荐与 ControlNet 结合起来使用，有助于保持构图，避免产生多头或图像变形。
  #
  # 它的工作原理是将图像分成网格（图块）并对其进行修复。你可以调整接缝的大小，让图块过渡变得自然。这个超分工具下面可以选很多算法，对于真实类照片，我一般直接无脑选 ESRGAN，其他图片选择 R-ESRGAN 4x+。有关该插件的各参数教程和说明，可以看这里。
clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git

#翻译
clone https://github.com/butaixianran/Stable-Diffusion-Webui-Prompt-Translator.git

#lora prompt
clone https://github.com/a2569875/lora-prompt-tool.git

# 手部修复
clone https://github.com/jexom/sd-webui-depth-lib.git

#脸部修复
clone https://github.com/Bing-su/adetailer.git

clone https://github.com/AIrjen/OneButtonPrompt.git

clone https://github.com/dtlnor/stable-diffusion-webui-localization-zh_CN.git