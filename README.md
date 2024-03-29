# Mouthless Custom Sigil

Repository with all custom sigil that I made. They are sorted into different folder:

-   [`based`](./based/) contain inscryption sigil and improve version that are more customizable.
-   [`magic`](./magic/) contain ported keyword from Magic the Gathering.
-   [`extra`](./extra/) contain dependency that some sigil may need.

In those folder you can see specification on how to use them and all the documentation for each sigil. Below are a list of which sigil is where:

-   [`based`](./based/):
    -   [`detonator`](./based/detonator.gd): Detonator but with customizable damage.
    -   [`giftBearer`](./based/giftBearer.gd): Gift Bearer from Inscryption.
    -   [`unkillable`](./based/unkillable.gd): Unkillable but with optional buff when respawn.
-   [`magic`](./magic/):
    -   [`lifelink`](./magic/lifelink.gd): Lifelink from Magic. Airborne but also deal damage to the card
    -   [`sigilwalk`](./magic/sigilwalk.gd): Landwalk but for sigil. Airborne only when the opponent control a card with sigil.
    -   [`revSigilwalk`](./magic/revSigilwalk.gd): Lankwalk but it only activate when you control the sigil.
    -   [`spell`](./magic/spell.gd): Kill the card on summon
    -   [`spellbook`](./magic/spellbook.gd): Spellbook from Magic Arena.
    -   [`scry`](./magic/scry.gd): Scry from Magic. Let you look at the top N card and put them back in any order on top of your deck or the bottom.
