import { dev } from "$app/environment";
import { onMount } from "svelte";
import { writable } from "svelte/store";

export const user = $state({
    name: "",
    token: "",
    display: "",
    id: 0,
    colorscheme: "",
    pfp: "%sveltekit.assets%/anonymous.png",
});

export const api = dev ? "http://localhost/api/" : "/lwim_api/";
export const base = dev ? "http://localhost:5173/" : "/lwim/";

export let mobile = 0;
if (typeof window !== "undefined") {
    mobile = window.innerWidth < 768;
}

export let known_users = writable([]);

export function get_display(thing, other) {return thing? thing : "u/"+other; }

export function getContrastColor(bgColor) {
  // Remove "#" if present
  bgColor = bgColor.replace("#", "");
  const r = parseInt(bgColor.substr(0, 2), 16);
  const g = parseInt(bgColor.substr(2, 2), 16);
  const b = parseInt(bgColor.substr(4, 2), 16);

  // Calculate brightness (perceived luminance)
  const brightness = (r * 299 + g * 587 + b * 114) / 1000;

  // Return color based on brightness
  return brightness > 128 ? "#000000" : "#FFFFFF";
}