SVN notes:
  * Luôn update trước khi commit
  * Nếu 2 người cùng làm trên 1 file bắt đầu từ 1 rev thì khi 1 người commit, người còn lại khi update sẽ bị conflict, khi đó hệ thống sẽ sinh ra 4 file (.. hình minh họa), sau khi ghép lại thành công sẽ ấn vào resolving để xác nhận rồi mới có thể commit.