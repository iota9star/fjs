export function price(ids: string[]) {
  return fetch(`https://api.jup.ag/price/v2?ids=${ids.join(',')}`).then(res => res.json());
}