# ComfyUI ROCm Docker Image

🔥 **ComfyUI with AMD ROCm support** - Run ComfyUI on AMD GPUs with optimized ROCm-compatible dependencies.

![ComfyUI Interface](screenshot.png)
*ComfyUI running on AMD ROCm with sample workflow and generated landscape image*

## 📋 Version Information

- **Base Image**: `rocm/pytorch:rocm7.11.0_ubuntu24.04_py3.12_pytorch_release_2.11.0`
- **Python**: 3.12.3
- **PyTorch**: 2.11.0
- **ROCm**: 7.11.0
- **ComfyUI**: v0.8.2 

## ✨ Key Features

- 🎨 **Node-based AI workflow** - Visual interface for creating complex AI pipelines
- 🔥 **AMD ROCm optimized** - Native AMD GPU acceleration with ROCm 7.0+
- 📦 **Smart model management** - Automatic downloads with configurable model sets
- 🧪 **Tested compatibility** - All dependencies verified on real AMD hardware
- 🎯 **Ready to use** - Pre-configured with sample workflows
- 💾 **Persistent storage** - Models and outputs preserved across restarts


## 🚀 Quick Start

# docker-compose.yaml
```yaml
services:
  comfyui-rocm:
    image: qinzhen/comfyui-rocm:latest
    container_name: comfyui-rocm
    runtime: runc
    devices:
      - /dev/kfd:/dev/kfd
      - /dev/dri:/dev/dri
    group_add:
      - video
    ports:
      - "8188:8188"
    volumes:
      - ./data/models:/workspace/ComfyUI/models
      - ./data/output:/workspace/ComfyUI/output
      - ./data/input:/workspace/ComfyUI/input
      - ./data/custom_nodes:/workspace/ComfyUI/custom_nodes
      - ./data/user:/workspace/ComfyUI/user
    environment:
      - MODEL_DOWNLOAD=default
      - HSA_OVERRIDE_GFX_VERSION=11.5.1
    restart: unless-stopped
```
Run with: `docker compose up -d`
ComfyUI listen at: **http://0.0.0.0:8188**

## 📋 Requirements

| Component  | Requirement                                |
| ---------- | ------------------------------------------ |
| **GPU**    | AMD series with ROCm RDNA 3.5  support     |
|   Depends on number of - HSA_OVERRIDE_GFX_VERSION=      |
| **VRAM**   | 8GB minimum (16GB+ recommended)            |
| **OS**     | Linux (Ubuntu 24.04+ recommended)          |
| **Docker** | Latest official version (29.1.4)           |
| **ROCm**   | Drivers 7.11.0+ installed on host           |

## 🔧 Setup Instructions

### 1. Install ROCm Drivers()

https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/quick-start.html

### 2. Verify ROCm Installation
```bash
rocminfo  # Should show your AMD GPU model in Agent 2
```
For example

*******                  
Agent 2                  
*******                  
  Name:                    gfx1151                            
  Uuid:                    GPU-XX                             
  Marketing Name:          AMD Radeon Graphics                
  Vendor Name:             AMD                                
  Feature:                 KERNEL_DISPATCH                    
  Profile:                 BASE_PROFILE                       
  Float Round Mode:        NEAR                               
  Max Queue Number:        128(0x80)                          
  Queue Min Size:          64(0x40)                           
  Queue Max Size:          131072(0x20000)                    
  Queue Type:              MULTI                              
  Node:                    1                                  
  Device Type:             GPU                                
  Cache Info:              
    L1:                      32(0x20) KB                        
    L2:                      2048(0x800) KB                     
    L3:                      32768(0x8000) KB                   
  Chip ID:                 5510(0x1586) 


## ⚡ Performance & Hardware

### Tested Hardware
- **AMD AI MAX+ 395 (96GB VRAM) ✅

## 📄 License & Credits

This project is licensed under GPL-3.0. See the [LICENSE](LICENSE) file for details.

### Third-Party Components
- **ComfyUI**: GPL-3.0 - [ComfyUI](https://github.com/comfyanonymous/ComfyUI)
- **PyTorch**: BSD 3-Clause - [PyTorch](https://pytorch.org/)
- **ROCm**: Various OSS licenses - [AMD ROCm](https://rocm.docs.amd.com/)

**Acknowledgments:**
- [ComfyUI](https://github.com/Comfy-Org/ComfyUI) - Node-based AI workflow interface
- [AMD ROCm](https://rocm.docs.amd.com/) - Open source GPU computing platform  
- ROCm community for AMD GPU AI support

---

🔗 **Links:** [Docker Hub](https://hub.docker.com/r/qinzhen/comfyui-rocm) | [GitHub](https://github.com/gexqin/ComfyUI-ROCm) | [ComfyUI](https://github.com/Comfy-Org/ComfyUI)
