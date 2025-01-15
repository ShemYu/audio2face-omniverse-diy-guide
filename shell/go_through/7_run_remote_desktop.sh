# 啟動虛擬螢幕串流
x11vnc -display :99 -noxdamage -forever -shared &

# 從外往透過 vnc://IP:5900 連接可看到虛擬螢幕, 建議使用 tigerVNC