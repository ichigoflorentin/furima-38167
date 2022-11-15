

const pay = () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const submit = document.getElementById("button");

    submit.addEventListener("click", (e) => {
      e.preventDefault();

      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
  
      const card = {
        number: formData.get("buyer_shipping_address[number]"),
        cvc: formData.get("buyer_shipping_address[cvc]"),
        exp_month: formData.get("buyer_shipping_address[exp_month]"),
        exp_year: `20${formData.get("buyer_shipping_address[exp_year]")}`,
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        const numberLoad =  document.getElementById("card-number")
        const cvcLoad =  document.getElementById("card-cvc")
        const monthLoad =  document.getElementById("card-exp-month")
        const yearLoad =  document.getElementById("card-exp-year")

        numberLoad.removeAttribute("name");
        cvcLoad.removeAttribute("name");
        monthLoad.removeAttribute("name");
        yearLoad.removeAttribute("name");

        document.getElementById("charge-form").submit();
      });
    });
  };

  window.addEventListener("load", pay);