@ECHO OFF

for %%f in (\\server\archive\MiniDV\2020\*.avi) do (
  set /p val=<%%f
  
  echo "Starting copy of: %%f"
  xcopy /y %%f Input.avi*
  echo "Finished copy"

  echo "Starting conversion..."
  ffmpeg -i "ConvertMiniDV.avs" -c:v libx264 -preset medium -tune film -c:a aac \\server\video\2020\%%~nf.mp4
  echo "Finished conversion"
  
  echo "Deleting input file..."
  del Input.avi
  echo "Finished deleting" 
)