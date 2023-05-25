/*<script src="https://code.jquery.com/jquery-3.6.4.js">
</script>*/
$(function(){      

    // 슬릭 슬라이드 시작!
   /* $('.slide-container').slick({*/	
    $('.slide-container').not('.slick-initialized').slick({
        dots: false,
        arrows: false,
        
            /* 반응형 */
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                }
            },
            {
                breakpoint: 800,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },
    
        ]       
    })
    
      $('.slide-nav').slick ({
          dots: false,       // img 앞에 dots가 생기는데 false로 설정되어 있음               
         arrows: false,
        slidesToShow: 5,
        slidesToScroll: 1,

        pauseOnDotsHover: true,         // 페이지네이션 호버 시 자동재생 멈춤
        pauseOnFocus: true,             // 포커스 시, 자동재생 멈춤
        pauseOnHover: true,             // 호버 시, 자동재생 멈춤
        
        centerMode: true,
        focusOnSelect: true,
        asNavFor: '.slide-container',
    })
       

    /* navi 메뉴닫기 */
    $('#btn-close').on('click', function() {
        $('header').animate({
            'left' : '-25rem'            
        }, 400)
        
        $('body').animate({
            'padding-left' :0
        }, 400)
    })

    /* navi 메뉴열기 */
    $('#btn-menu').on('click', function() {
        $('header').animate({
            'left' : 0            
        }, 400)

        $('body').animate({
            'padding-left' :'25rem'
        },400)
    })
})
