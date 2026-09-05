const bar = document.querySelector('.progress span');
const reveals = document.querySelectorAll('.reveal');
const observer = new IntersectionObserver((entries) => entries.forEach((entry) => { if (entry.isIntersecting) entry.target.classList.add('visible'); }), { threshold: 0.12 });
reveals.forEach((el) => observer.observe(el));
window.addEventListener('scroll', () => { const max = document.documentElement.scrollHeight - window.innerHeight; bar.style.width = `${max ? (window.scrollY / max) * 100 : 0}%`; }, { passive: true });
