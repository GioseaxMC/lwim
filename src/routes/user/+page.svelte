<script>
    import "$lib/env.svelte";
    import Input from "$lib/components/ui/Input.svelte";
    import Button from "$lib/components/ui/Button.svelte";
    import Posts from "$lib/components/ui/Posts.svelte";
    import Image from "$lib/components/ui/Image.svelte";
    import { api, user } from "$lib/store.svelte";
    import { dev } from "$app/environment";
    import { goto } from "$app/navigation";
    import { onMount } from "svelte";

    let username = $state({});
    let usr = $state(["---","---","---","---","---","---"]);
    let posts = $state([]);

    async function main() {
        const url = new URL(window.location.href).searchParams;
        username = url.get("name");

        let response = await fetch(api + "user.php", {
            method: "POST",
            body: JSON.stringify({
                username: username
            }),
        });
        
        if (response.ok) {
            let json = await response.json();
            usr = json;
        
        } else {
        
            response.text().then(text => console.log);
        }
        
        fetch(
            api + "get_posts.php", {
            method: "POST",
            body: JSON.stringify({
                from: usr[0],
                limit: 1000,
            }),
        }).then(response => {
            if ( response.ok ) {
                response.json().then(json => {
                    posts = json.map(obj => {
                        const { CodUser, ...rest } = obj;
                        return { user: CodUser, ...rest };
                    });
                })
            } else {
                posts = {
                    content: "Error retrieving messages"
                };
            }
        });
    }

    onMount(()=>{
        main();
    });
        

</script>
<style>

.container {
    display: grid;
    border: 1px var(--border) solid;
    background-color: var(--primary);
    padding: 20px;
    border-radius: var(--border-radius);
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
}

.center-container {
	display: flex;
    flex-direction: column;
	justify-content: center;
	margin: 10px 0;
    padding: 10px;
}

</style>

<div class="center-container">
    <div class="container" style="background: linear-gradient(180deg, var(--primary) -50%, {usr[6]} 200%);">
        <div style="display: flex">
            <Image src={usr[7]} width=75px height=75px/>
            <div>
                <div style="display: flex; gap: 10px">
                    <h3>{usr[5]}</h3>
                    <h3 class="st" style="color: var(--border)">#{usr[0]}</h3>
                </div>
                <p class="st" style="color: var(--border)">@{usr[1]}</p>
            </div>
        </div>
        <br>
        <p class="st">Joined: {usr[3]}</p>
    </div>
    <br>
    <Posts posts={posts} />
</div>

