//구글맵 스크립트 (게시판 글 작성할 때 사용)
 var latValue, lngValue; //DB에 넣을 값 (위도, 경도)

function myMap() {
   

    //맵설정 (초기 화면)
    var mapProp = {//center:맵 중앙 위치 , LatLng(위도, 경도),  zoom=확대 정도 
        center: new google.maps.LatLng(37.577424, 126.980176), zoom: 15
    };
    //id가 구글맵인 곳에 지도 넣기
    var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);	

    var dest = new google.maps.LatLng(37.581771, 126.980540); //마커로 쓸 위치	
    var marker = new google.maps.Marker({ position: dest }); //새로운 마커 생성
    marker.setMap(map); //마커를 지도에 추가

    //정보창 설정
    var infowindow = new google.maps.InfoWindow({
        content: "모일 위치" //표시할 내용
    });
    //마커를 클릭했을 때 정보창 띄우기 
    google.maps.event.addListener(marker, "click", function () {
        infowindow.open(map, marker); //생성한 구글맵의 마커 위치에 
    });

    ///////지도에서 클릭할 때 위치 얻기
    google.maps.event.addListener(map, "click", function (point) {
        // lat = document.getElementById("lat"); // input태그 1(테스트용)
        // lng = document.getElementById("lng"); // input태그 2(테스트용)
        latValue = point.latLng.lat(); //위도 값
        lngValue = point.latLng.lng(); //경도 값
        // lat.value = latValue; //(테스트용)
        // lng.value = lngValue; //(테스트용)
        
        //클릭한 곳으로 마커위치 변경
        var latlng = new google.maps.LatLng(latValue, lngValue); //클릭한 곳 위치
        marker.setPosition(latlng); //클릭한 곳으로 마커 위치 변경
    });
    ///////////주소 자동완성 하기
    var input = document.getElementById("location"); //id가 --인 div태그 찾기
    var autocomplete = new google.maps.places.Autocomplete(input); //input태그에 주소 자동완성 생성
    
    autocomplete.bindTo('bounds', map);

    autocomplete.addListener('place_changed', function () {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("주소가 없습니다: '" + place.name + "'");
            return;
        }

        // If the place has a geometry, then present it on a map.
        if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
        } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
        }
        marker.setPosition(place.geometry.location);
        marker.setVisible(true);

        // lat = document.getElementById("lat"); // input태그 1(테스트용)
        // lng = document.getElementById("lng"); // input태그 2(테스트용)
        // lat.value = place.geometry.location.lat(); //위도를 인풋1에 넣기(테스트용)
        // lng.value = place.geometry.location.lng(); //경도를 인풋2에 넣기(테스트용)
        
        //자동완성 주소로 선택할 때 지도 위치 저장
        latValue = place.geometry.location.lat(); //위도 값
        lngValue = place.geometry.location.lng(); //경도 값
        var lla = new google.maps.LatLng(latValue, lngValue); //테스트
        marker.setPosition(lla); //테스트
//        marker.setPosition(latlng); //자동완성주소로 마커셋 (에러발생)

        var address = '';
        if (place.address_components) {
            address = [
                (place.address_components[0] && place.address_components[0].short_name || ''),
                (place.address_components[1] && place.address_components[1].short_name || ''),
                (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
        }
    });

    

};

function checkForm(){ //lat lng 넘기고 form태그 submit
	
	form = document.form;
//	form.action = "writeAction.jsp"; //??
	lat= document.form.latitude;
	
	lng= document.form.longitude;
	lat.value =latValue;
	lng.value = lngValue;
	form.submit();
}