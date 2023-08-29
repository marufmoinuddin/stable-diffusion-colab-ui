
# Stable Diffusion Colab UI

This Colab notebook allows you to use the Stable Diffusion software to create visually appealing images using pretrained models. Stable Diffusion is a generative model that can produce high-quality images from text descriptions.

Original notebook: [Easy-Diffusion.ipynb](https://colab.research.google.com/drive/1azbWcuk5Bs-IF4Hbv7UouNClj2amo8an)

## Instructions

1. Open the provided Colab notebook link: [Easy-Diffusion.ipynb](https://colab.research.google.com/drive/1azbWcuk5Bs-IF4Hbv7UouNClj2amo8an)

2. Run the notebook cells to set up the environment and download necessary files.

## Or create for scratch:

1. The following commands are used to download the model checkpoints:
   ```bash
   wget -O ./easy-diffusion/models/stable-diffusion/anythingv45.ckpt https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5.ckpt
   wget -O ./easy-diffusion/models/stable-diffusion/dreamlikev20.ckpt https://huggingface.co/dreamlike-art/dreamlike-photoreal-2.0/resolve/main/dreamlike-photoreal-2.0.ckpt
   wget -O ./easy-diffusion/models/stable-diffusion/islamicdiffusion.ckpt https://huggingface.co/Falah/islamicdiffusion/blob/main/islamicdiffusion.ckpt
   ```

2. Install the required `pyngrok` package by running:
   ```bash
   !pip install pyngrok
   ```

3. Import the necessary modules and set up an authentication token for ngrok tunneling:
   ```python
   from pyngrok import ngrok
   ngrok.set_auth_token("2NmWjThs9G7IwLaRMUffSgdNDax_84cxU5DQmcn2QphR9ULCk")
   ```

4. Connect ngrok to a port (e.g., port 8888) and print the tunnel details:
   ```python
   ngrok_tunnel = ngrok.connect(8888)
   print(ngrok_tunnel)
   ```

5. Run the Stable Diffusion user interface using the following command:
   ```bash
   SD_UI_BIND_PORT=8888 ./easy-diffusion/start.sh
   ```

6. Access the Stable Diffusion user interface by clicking on the ngrok tunnel link displayed in the output. This will open a web interface where you can provide text descriptions and generate images using the pretrained models.

7. Experiment with different text descriptions to see how the model interprets and generates corresponding images.

Remember to terminate the ngrok tunnel and stop the Stable Diffusion user interface when you are done.

For more details, refer to the original Colab notebook: [Easy-Diffusion.ipynb](https://colab.research.google.com/drive/1azbWcuk5Bs-IF4Hbv7UouNClj2amo8an)
```

Feel free to add any additional information or customization to this README as needed.
