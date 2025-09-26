export const hoverImage = {
  mounted(el, binding) {
    const { image, width = 150, height = 150 } = binding.value || {};

    if (!image) return;

    const hoverImage = document.createElement('div');
    hoverImage.style.position = 'absolute';
    hoverImage.style.pointerEvents = 'none';
    hoverImage.style.opacity = '0';
    hoverImage.style.transition = 'opacity 0.3s ease';
    hoverImage.style.width = `${width}px`;
    hoverImage.style.height = `${height}px`;
    hoverImage.style.backgroundImage = `url(${image})`;
    hoverImage.style.backgroundSize = 'cover';
    hoverImage.style.backgroundPosition = 'center';
    hoverImage.style.zIndex = '10';

    el.style.position = 'relative';
    el.appendChild(hoverImage);

    el.addEventListener('mousemove', (e) => {
      const rect = el.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;

      hoverImage.style.left = `${x - width / 2}px`;
      hoverImage.style.top = `${y - height / 2}px`;
      hoverImage.style.opacity = '1';
    });

    el.addEventListener('mouseleave', () => {
      hoverImage.style.opacity = '0';
    });
  }
};
