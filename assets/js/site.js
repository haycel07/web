document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('#year').textContent = new Date().getFullYear();
  const items = [...document.querySelectorAll('.reveal')];
  const reveal = (entry) => entry.target.classList.add('is-visible');
  if ('IntersectionObserver' in window && !window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
    const observer = new IntersectionObserver((entries) => entries.forEach((entry) => { if (entry.isIntersecting) { reveal(entry); observer.unobserve(entry.target); } }), { threshold: 0.12 });
    items.forEach((item) => observer.observe(item));
  } else { items.forEach((item) => reveal({ target:item })); }

  const links = [...document.querySelectorAll('nav a')];
  const sections = links.map((link) => document.querySelector(link.getAttribute('href'))).filter(Boolean);
  const navigation = new IntersectionObserver((entries) => entries.forEach((entry) => {
    if (!entry.isIntersecting) return;
    links.forEach((link) => link.removeAttribute('aria-current'));
    const link = links.find((item) => item.getAttribute('href') === `#${entry.target.id}`);
    if (link) link.setAttribute('aria-current', 'page');
  }), { rootMargin:'-35% 0px -55% 0px' });
  sections.forEach((section) => navigation.observe(section));
});
