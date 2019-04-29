/**
 * 구글맵 사용자에게 보이게 하는 자바스크립트
 * latValue, lngValue는 나중에 DB에서 값을 받아와야 됨
 */


function myMap(){
	var latValue = 51.508742; // 위도 
	var lngValue = -0.120850; // 경도
	
	//맵설정
	
	var mapProp ={//center:맵 중앙 위치 정함, LatLng(위도, 경도),  zoom=확대 정도 
			center: new google.maps.LatLng(latValue,lngValue), zoom:13 
	};
	var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);//id가 구글맵인 곳에 지도 넣기	
	
	var dest = new google.maps.LatLng(latValue, lngValue); //마커로 쓸 위치	
	var marker = new google.maps.Marker({position: dest}); //새로운 마커 생성
	marker.setMap(map); //마커를 지도에 추가
	
	//정보창 설정
	var infowindow = new google.maps.InfoWindow({
		content: "I'm infoWindow" //표시할 내용
	});
	//마커를 클릭했을 때 정보창 띄우기 
	google.maps.event.addListener(marker, "click", function(){
		infowindow.open(map, marker); //생성한 구글맵의 마커 위치에 
	});
	
	
};