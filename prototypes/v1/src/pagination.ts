export class Page {
  n: number = 0;
  text: string = "";
  url: string = "";
  highlight: string = "";
}

function newPage(current: boolean, t: number, u: (n: number) => string): Page {
  let p = {
    n: t,
    text: t.toString(),
    url: u(t),
    highlight: "",
  };
  if (t == 0) {
    p.text = "...";
    p.url = "";
  }
  if (current) {
    p.highlight = "1";
  }
  return p;
}

export function pagination(
  url: string,
  current: number,
  total: number,
): Page[] {
  // Get URL and strip page parameter
  if (total <= 1) return [];

  function no_url(_n: number): string {
    return "";
  }

  function a_url(n: number): string {
    let baseURL = new URL(url);
    baseURL.searchParams.delete("page");
    baseURL.searchParams.set("page", n.toString());

    return baseURL.toString();
  }

  const center = [
    newPage(false, current - 2, a_url),
    newPage(false, current - 1, a_url),
    newPage(true, current, a_url),
    newPage(false, current + 1, a_url),
    newPage(false, current + 2, a_url),
  ];

  const filteredCenter = center.filter((p) => p.n > 1 && p.n < total);
  const includeThreeLeft = current === 5,
    includeThreeRight = current === total - 4,
    includeLeftDots = current > 5,
    includeRightDots = current < total - 4;

  if (includeThreeLeft) filteredCenter.unshift(newPage(false, 2, a_url));
  if (includeThreeRight) filteredCenter.push(newPage(false, total - 1, a_url));

  if (includeLeftDots) filteredCenter.unshift(newPage(false, 0, no_url));
  if (includeRightDots) filteredCenter.push(newPage(false, 0, no_url));

  return [
    newPage(current == 1, 1, a_url),
    ...filteredCenter,
    newPage(current == total, total, a_url),
  ];
}
