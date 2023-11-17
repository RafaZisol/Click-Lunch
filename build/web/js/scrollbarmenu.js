      function scrollCards(direction) {
        const container = document.querySelector('.container-scroll');
        const scrollAmount = 200;

        if (direction === 'left') {
          container.scrollLeft -= scrollAmount;
        } else {
          container.scrollLeft += scrollAmount;
        }
      }