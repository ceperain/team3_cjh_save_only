/************************
 * recom.jsp 룰렛 출력 js
 ************************/
 
(function($) {
    // alert(sessionStorage.getItem("usersno"));
    // alert('${usersno}');
    // sendMessage('usersno');
    // sendMessage(sessionStorage.getItem("usersno"));
    $.fn.extend({

      roulette: function(options) {

        var defaults = {
          angle: 0,
          angleOffset: -45,
          speed: 5000,
          easing: "easeInOutElastic",
        };

        var opt = $.extend(defaults, options);

        return this.each(function() {
          var o = opt;
          var a = new Array();
          // alert('${usersno}');
          store = sendMessage(document.getElementById('usersno').value);

          var data = [];
          var color = ['#3f297e', '#1d61ac', '#169ed8', '#209b6c', '#60b236', '#efe61f', '#f7a416', '#e6471d', '#dc0936', '#e5177b'];
          
          for(var i = 0; i < color.length; i++){
              data.push({
                  color: color[i],
                  text: store[i]
              });
          }

          // console.log(data);
          var $wrap = $(this);
          var $btnStart = $wrap.find("#btn-start");
          var $roulette = $wrap.find(".roulette");
          var wrapW = $wrap.width();
          var angle = o.angle;
          var angleOffset = o.angleOffset;
          var speed = o.speed;
          var esing = o.easing;
          var itemSize = data.length;
          var itemSelector = "item";
          var labelSelector = "label";
          var d = 360 / itemSize;
          var borderTopWidth = wrapW;
          var borderRightWidth = tanDeg(d);

          for (i = 1; i <= itemSize; i += 1) {
            var idx = i - 1;
            var rt = i * d + angleOffset;
            var itemHTML = $('<div class="' + itemSelector + '">');
            var labelHTML = '';
                labelHTML += '<p class="' + labelSelector + '">';
                labelHTML += '    <span class="text">' + data[idx].text + '<\/span>';
                labelHTML += '<\/p>';

            $roulette.append(itemHTML);
            $roulette.children("." + itemSelector).eq(idx).append(labelHTML);
            $roulette.children("." + itemSelector).eq(idx).css({
              "left": wrapW / 2,
              "top": -wrapW / 2,
              "border-top-width": borderTopWidth,
              "border-right-width": borderRightWidth,
              "border-top-color": data[idx].color,
              "transform": "rotate(" + rt + "deg)"
            });

            var textH = parseInt(((2 * Math.PI * wrapW) / d) * .5);

            $roulette.children("." + itemSelector).eq(idx).children("." + labelSelector).css({
              "height": textH + 'px',
              "line-height": textH + 'px',
              "transform": 'translateX(' + (textH * 1.9) + 'px) translateY(' + (wrapW * -.40) + 'px) rotateZ(' + (90 + d * .5) + 'deg)'
            /*   "transform": 'translateX(' + (textH * 1.3) + 'px) translateY(' + (wrapW * -.3) + 'px) rotateZ(' + (90 + d * .5) + 'deg)' */
            });

          }

          function tanDeg(deg) {
            var rad = deg * Math.PI / 180;
            return wrapW / (1 / Math.tan(rad));
          }

          $btnStart.on("click", function() {
            rotation();
          });

          function rotation() {

            var completeA = 360 * r(5, 10) + r(0, 360);

            $roulette.rotate({
              angle: angle,
              animateTo: completeA,
              center: ["50%", "50%"],
              easing: $.easing.esing,
              callback: function() {
                var currentA = $(this).getRotateAngle();

                console.log(currentA);

              },
              duration: speed
            });
          }

          function r(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
          }

        });
      }
    });
  })(jQuery);

  $(function() {

    $('.box-roulette').roulette();

  });

  function sendMessage(usersno){
      let params = "";  
      let store = new Array();
      let pred = new Array();
  //    params = message; 
  
      $.ajax(
        {
          url: 'http://13.124.253.27:8000/recommend_store/req_ajax/' + usersno,
          type: 'get',  // get, post
          cache: false, // 응답 결과 임시 저장 취소
          async: false,  // true: 비동기 통신
          dataType: 'json', // 응답 형식: json, html, xml...
        //  data: params,      // 데이터
          success: function(rdata) { 
             var name = rdata.NAME;
             var prediction = rdata.prediction;

             for (var key in name) {
                 store.push(name[key] + '(' + prediction[key] + '%)');
             }
          },
          // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          error: function(request, status, error) { // callback 함수
            console.log(error);
          }
        }
      );
      return store;
 }