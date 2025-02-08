<div align="center">
<h1 align="center">ImgPilot</h1>

Image pilot with the power of Real-Time Latent Consistency Model.
<br/>
<br/>


[preview.webm](https://github.com/leptonai/imgpilot/assets/1506722/5118e266-6db5-4451-96f3-bc97de594cc6)



[DEMO](https://imgpilot.com/)
</div>

## ✨ Features

- Includes complete front-end and back-end code.
- Support deployment both locally and in the cloud.
- Fully based on open source and can be used for commercial purposes.


## 📦 Install

```bash
# Install web dependencies
npm install

# Install server dependencies
pip install -r requirements.txt -U
```

## ⌨️ Development

```bash
# Start server on localhost:8080

lep photon runlocal -n imgpilot -m photon/main.py
```

```bash
# Start web server on localhost:3000

npm run dev
```



## 🔗 Built with

- [Lepton AI](https://github.com/leptonai/leptonai)
- [Excalidraw](https://github.com/excalidraw/excalidraw)
- [Real-Time-Latent-Consistency-Model](https://huggingface.co/spaces/radames/Real-Time-Latent-Consistency-Model)

## 📁 Project Structure

```
imgpilot/
├── photon/                 # Backend Python code
│   ├── main.py            # Main server file
│   └── utils/             # Utility functions
│
├── src/                    # Frontend React code
│   ├── components/        # React components
│   ├── styles/           # CSS and style files
│   ├── utils/            # Frontend utilities
│   ├── App.js            # Main React component
│   └── index.js          # React entry point
│
├── models/                # AI model files
│   └── LCM_Dreamshaper_v7/  # Image generation model
│
├── public/               # Static files
│   ├── index.html
│   └── assets/
│
├── requirements.txt      # Python dependencies
├── package.json         # Node.js dependencies
├── .gitignore
└── README.md
```

## 🔧 Technical Details

### Backend
- Python-based server using Lepton AI
- Real-Time Latent Consistency Model for image generation
- RESTful API endpoints for image processing

### Frontend
- React.js for UI components
- Material-UI for styling
- Axios for API requests
- WebSocket for real-time updates

### API Endpoints

#### `/run`
- Method: POST
- Purpose: Generate or modify images
- Parameters:
  - `prompt`: Text description
  - `input_image`: Original image (optional)
  - `strength`: Generation strength (0-1)
  - `seed`: Random seed
  - `steps`: Number of generation steps
  - `guidance_scale`: Generation guidance scale
  - `width`: Output image width
  - `height`: Output image height
  - `lcm_steps`: LCM steps

### Model Details
- Base Model: LCM Dreamshaper v7
- Input Resolution: 512x512
- Supported Image Formats: PNG, JPEG
- VRAM Requirements: ~4GB

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🛠️ Technology Stack

### Frontend
- **Framework**: 
  - React.js 18.x
  - Create React App for project setup
- **UI/Styling**:
  - Material-UI (MUI) v5
  - Emotion for styled components
  - CSS Modules
- **State Management**:
  - React Hooks
  - Context API
- **HTTP Client**:
  - Axios for API requests
- **Development Tools**:
  - ESLint
  - Prettier
  - npm/yarn for package management

### Backend
- **Core**:
  - Python 3.9+
  - Lepton AI Framework
- **AI/ML**:
  - PyTorch 2.6.0
  - Diffusers
  - Transformers
  - Real-Time Latent Consistency Model
- **API**:
  - FastAPI
  - RESTful architecture
  - WebSocket support
- **Development Tools**:
  - pip for package management
  - PyInstaller for executable building

### DevOps & Deployment
- **Version Control**:
  - Git
  - GitHub
- **CI/CD**:
  - GitHub Actions
- **Deployment Options**:
  - Docker containers
  - Cloud platforms (AWS, GCP, Azure)
  - Heroku/Railway/Vercel

### System Requirements
- **Hardware**:
  - CPU: 4+ cores recommended
  - RAM: 8GB minimum, 16GB recommended
  - GPU: NVIDIA GPU with 4GB+ VRAM (for optimal performance)
- **Software**:
  - CUDA Toolkit 11.8 (for GPU support)
  - Node.js 16.x or higher
  - Python 3.9 or higher

### Development Environment Setup
```bash
# Frontend setup
npm install
npm start

# Backend setup
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```
