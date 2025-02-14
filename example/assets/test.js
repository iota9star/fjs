function i(t){return fetch(`https://api.jup.ag/price/v2?ids=${t.join(",")}`).then(e=>e.json())}export{i as price};
