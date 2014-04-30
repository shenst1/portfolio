$( document ).ready(function() {
  (function ( $ ) {
    $.fn.headspin = function(options) {
      var settings = $.extend({
        container: $("#fox"),
        frames: 7,
        img: $("#fox-image")
      }, options );
      console.log(settings.container)
      console.log("triggered headspin")
      console.log(settings.img)

      var pic_real_width,
          pic_real_height,
          width_quotient,
          container_width_quotient,
          real_width_quotient,
          con_width,
          container = settings.container,
          frames = settings.frames,
          start = Math.floor(frames/2),
          img = settings.img,
          x1, cx1, x2, cx2, y1=0, y2;

      pic_real_width = img.width();
      // console.log("pic real width  " + pic_real_width)
      pic_real_height = img.height;
      var real_width_quotient = pic_real_width/frames;
      // console.log("pic real width quotient " + real_width_quotient)
      con_width = container.width()
      // console.log("container width" + con_width)
      container_width_quotient = con_width/frames;
      // console.log("container width quotient" + container_width_quotient)
      img.css({"left":-(start*real_width_quotient)})


      // });
      var frameChange = function(width_quotient) {
        // console.log('made it to the callback')
        var offset = $(container).offset();
        // console.log("offset" + offset.left)
        $(container).bind("mousemove",function(e) {
          var mouseX=e.clientX;
          // console.log(clickX)

          var mouseY=e.clientY - offset.top;
          // console.log(clickY)

          for (i=0; i<frames; i++) {

            cx1 = (container_width_quotient*i)+offset.left;
            left = width_quotient*i;
            cx2 = (container_width_quotient*(i+1))+offset.left;
            // y2 = pic_real_height;
            // console.log("cx1= " + cx1 + "mouseX= " + mouseX + "cx2= " + cx2)
            if(mouseX>=cx1&&mouseX<=cx2) {
              $(img).css({"left":-left})
            }
          }
        });
      }
      frameChange(real_width_quotient);

    }
  }( jQuery ));
});

