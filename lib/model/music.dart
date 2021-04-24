var musics = [
  Music('Có Chắc Yêu Là Đây', 'WaitingForLove.mp3', 'ccyld.jpg'),
  Music('Waiting For Love', 'WaitingForLove.mp3', 'maxresdefault.jpg'),
  Music('Em của ngày hôm qua', 'Em Cua Ngay Hom Qua.mp3',
      '4443_cam-am-sao-truc-em-cua-ngay-hom-qua.jpg'),
  Music('Way Back Home', 'WaitingForLove.mp3','WayBackHome.jpg'),
  Music('Something Just Like This', 'WaitingForLove.mp3','Something_Just_Like_This.png'),
  Music('Phao - 2 Phut Hon', 'WaitingForLove.mp3','haiphuthon.jpg'),
  Music('XIN ĐỪNG NHẤC MÁY', 'WaitingForLove.mp3','bray.jpg'),
  Music('Exs Hate Me - B Ray x Masew ', 'WaitingForLove.mp3','bray.jpg'),
  Music('Lời Yêu Ngây Dại - Kha', 'WaitingForLove.mp3','lynd.jpg'),
  Music('Người Có Thương', 'WaitingForLove.mp3','maxresdefault.jpg'),
  Music('Có Tất Cả Nhưng Thiếu Anh', 'WaitingForLove.mp3',''),
  Music("If It" + "'" + "s Me - The Men Band", 'WaitingForLove.mp3','cotatcanhungthieuanh.jpg'),
  Music('Em Luôn Ở Trong Tâm Trí Anh', 'WaitingForLove.mp3','elttta.jpg'),
  Music('Mot Buoc Yeu, Van Dam Dau', 'WaitingForLove.mp3','motbuocyeuvandamdau.jpg')
];

class Music {
  final String title;
  final String path;
  final String image;

  Music(this.title, this.path,this.image);
}