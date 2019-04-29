//구글맵 스크립트  (사용자가 보는화면에서 사용 view2.jsp 사용)

function myMap() {
    //맵설정 (초기 화면)
    var mapProp = {//center:맵 중앙 위치 , LatLng(위도, 경도),  zoom=확대 정도 
        center: new google.maps.LatLng(Lat1, Lot1), zoom: 15
    };
    //id가 구글맵인 곳에 지도 넣기
    var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);	
    
    
    //원본var dest = new google.maps.LatLng(51.510750, -0.121936); //마커로 쓸 위치	
    var dest = new google.maps.LatLng(Lat1, Lot1); //마커로 쓸 위치 (view2.jsp 내부스크립트 값)

    
    var marker = new google.maps.Marker({ position: dest }); //새로운 마커 생성
    marker.setMap(map); //마커를 지도에 추가

    //정보창 설정
    var infowindow = new google.maps.InfoWindow({
        content: "버스 위치" //표시할 내용
    });
    //마커를 클릭했을 때 정보창 띄우기 
    google.maps.event.addListener(marker, "click", function () {
        infowindow.open(map, marker); //생성한 구글맵의 마커 위치에 
    });


};
