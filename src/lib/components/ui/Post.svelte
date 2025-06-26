<script>
    let { post } = $props();
    import { api, known_users, base } from "$lib/store.svelte";
    import { error } from "@sveltejs/kit";
    import { onMount } from "svelte";
    import { goto } from "$app/navigation";
    import Image from "./Image.svelte";

    let error_message = $state("");
    let user_info = $state([]);

    (()=>{
        let exists;
        known_users.subscribe(users => {
            exists = users.some(u => u[0] === post.user);
        })();
        if (!exists) {
            fetch(api + "user.php", {
                method: "POST",
                body: JSON.stringify(post),
            }).then(response => {
                if (response.ok) {
                    response.json().then(data => {
                        known_users.update(users=>[...users, data]);
                        user_info = data;
                    });
                } else {
                    response.text().then(text => {
                        error_message = text;
                    });
                }
            });
        } else {
            known_users.subscribe(users => {
                user_info = users.find(obj => obj[0] === post.user);
            })();
        }
    })();

</script>

<style>

.main {
    display: flex;
    border: 1px var(--border) solid;
    border-radius: var(--border-radius);
    padding: 16px 16px;
    margin: 0 auto;
    /* width: 100%; */
    /* max-width: 100%; */
    /* min-height: 100px; */
    margin-bottom: 10px;
    font-size: 90%;
}

.message {
    width: 100%;
    max-width: 100%;
    min-width: 0;
    display: flex;
    flex-direction: column;
}

button {
    appearance: none;
    background-color: transparent;
    border: 0;
    color: inherit;
}

</style>

<div class="main">

    <Image src={user_info[7]} width=40px height=40px/>

    <div class="message">
        <div style="flex: 1; display: flex">

            <button onclick={()=>goto(base+"user?name="+user_info[1])}>
                <h3>{user_info[5]}</h3>
            </button>

            <p style="margin-left: auto; color: var(--border-secondary)">{post.created_at.split(" ")[0].substring(2)}</p>
        </div>
        <div style="flex: 1; max-width: 100%">
            <p style="color: var(--red)">{error_message}</p>
            <pre style="max-width: 100%; font-family: var(--font)">{post.content}</pre>
        </div>
    </div>
</div>