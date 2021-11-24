import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Neptune XT™", "TRITON Plus", "Noblesse HR", "Delta V Plus", "MAT 253", "ZSX Rigaku Primus II", "Quanta 450 - FEI"],
    // strings: ["Sm-Nd", "U-Pb", "C-O", "MEV", "Sr-Sr"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
