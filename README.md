
<div id="introduction" class="section level3">
<h3>Introduction:</h3>
<p>The people who want to make divorce laws easier are also prone to justify the extramarital sex as “no wrong at all”, is that true? This study tries to analyze people’s attitude toward the divorce laws and their attitude toward the extramarital sex.</p>
</div>
<div id="data" class="section level3">
<h3>Data:</h3>
<p>Data collection: the General Social Survey (GSS) contains the data about societal attitudes, attributes and behaviors of American society from 1972 to 2012. The Duke University modify this data for our course’s use, so we basically have the tidy data in hand Cases: there are 57061 observations in GSS, but the study focus on the “modern” times which arrange from 2002 to 2012, so the cases of analysis is 16128. After NA values are removed, there are 3645 cases finally left. Variables: 2 variables. One variable is tdivlaw which is categorical because it has 3 options to this question (“easier”, “more difficult”, or “Stay the same”); The other variable is xmarsex which is categorical and ordinal and contains 5 levels(“1 Always wrong”, “2 Almost always wrong”, “3 Sometimes wrong”, “4 Not wrong at all”, “5 Other”). Study: it is an observational study because the random assignment method was not applied here. generalizability: the population of interest is all the residences in US, and the findings from this analysis can be generalized to that population due to its random sampling method. causality: these data cannot be used to establish causal links because just experiments can establish causality, while this study is observational study.</p>
<pre class="r"><code>gss1&lt;-subset(gss, gss$year&gt;=2002)  
gss2&lt;-cbind(gss1$divlaw, gss1$xmarsex)
data&lt;- as.data.frame(gss2[complete.cases(gss2), ])</code></pre>
</div>
<div id="exploratory-data-analysis" class="section level3">
<h3>Exploratory data analysis:</h3>
<p>1st, use the contingency table to get a ratio feeling about the 2 variables. 2nd, get summary statistics from the proportions. About 2.20% of divorce laws’ advocates justify extramarital sex, and this proportion is fairly higher than the divorce laws’ obstructers and those who want the laws stay the same. 3rd, draw a mosaic plot to visualize the contingency table.</p>
<pre class="r"><code>colnames(data)&lt;- c(&quot;divorcelaw&quot;,&quot;extramaritalsex&quot;)
tab&lt;-table(data$divorcelaw,data$extramaritalsex)  
print(tab)</code></pre>
<pre><code>##    
##        1    2    3    4
##   1  788  133  102   23
##   2 1559  107   38   18
##   3  658  144   62   13</code></pre>
<pre class="r"><code>prop&lt;-prop.table(tab,1)
print(prop)</code></pre>
<pre><code>##    
##              1          2          3          4
##   1 0.75334608 0.12715105 0.09751434 0.02198853
##   2 0.90534262 0.06213705 0.02206736 0.01045296
##   3 0.75028506 0.16419612 0.07069555 0.01482326</code></pre>
<pre class="r"><code>rownames(prop)&lt;-c(&quot;should Easier&quot;,&quot;more difficult&quot;,&quot;stay the same&quot;)
mosaicplot(prop, color=T, 
           main=&quot;Make divorce laws easier and justify extramarital sex?&quot;,
           xlab=&quot;Divorce law attitud&quot;,
           ylab=&quot;Extramarital sex attitude&quot;,
           cex.axis =0.8)</code></pre>
<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABUAAAAPACAMAAADDuCPrAAAAq1BMVEUAAAAAADoAAGYAOjoAOmYAOpAAZmYAZrY6AAA6OgA6Ojo6OpA6ZmY6kJA6kLY6kNtMTExmAABmAGZmOgBmOpBmZgBmZjpmZmZmkJBmtrZmtttmtv+QOgCQOmaQkNuQtpCQ27aQ2/+Wlpa2ZgC2kDq2tma2tv+225C2/7a2/9u2///Dw8PbkDrbtmbb25Db29vb/7bb/9vb///m5ub/tmb/25D//7b//9v///8VCGgoAAAACXBIWXMAAB2HAAAdhwGP5fFlAAAgAElEQVR4nO3d62LjSnaeYXTbPVImYysae8Z2JMfp0I4zOxwns0NJvP8rC3GuAgo81PoKZKHe58ferQNBcmGtjziRqo4AgCjVvR8AAOSKAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQadMB+vFctV6Gb+2773z7uXir5ld+/Gq43129hKf6X5+v5+8roTve9UV3eGzjOnE0DfL9l6gFHrqmmjyXrsHeYh/nhXtb0XQlnX0I6dZos2Rvhh9KGQE6Ds6OAH0A+Qfo6ZahAB06ztQ/Z+5tRf5KuvAQUq3RoaCBtfcQygjQYUb6lzMC9K5yD9Cv93GTyH0uQ3tJh929txW5T+ziQ0i0RvsdxskYP5AyAtR9HSVA7y/3AN05+5TuczkMs67Mu516gddxn9jFh5BmjY71fNgELSNAh3U/vKKtFKB39MgBegfSdbKUJ/sLraW9txXdJ0C7Dfr6eHKzCXz/oZorIEB/6xR+131NgJZmvQDVHv48c28ruk+A7t2tTu+Lx1FAgP7N61D4ejV/+yMBWiACNOlDSNFt7VZnfz1DuzmqvrrBrIAA/dv3ofD1MZUf/+oHaL9X/+J9o52C9px9PxHdHsViH7V39xY8BrrzRstvhm73xHl13bf3sw8cffAy4NwjCl9e0//ubnwA7i82T6F9mP3xj8UX/eCdz6oZXNLksc2WFHr+Z+7j0H3VLscLsMA6mf60fVhu9vmTO3347oG5N+e5uN//zav7AJdmf/K82y+7suy7H03uLVCZWTl23VL21Xi37ZPwahlu/HHZwSf2tnDbxQANt9E1z7z97rA225XycBczFRCgL7uh8PW6eTo4K8s7zec2ZLPe2h92q3A8wxrekBl+/v2XQIA2D2VosIPTUs6FGsPP98Pj7nvWeZxPs3sMPiKvpWdP8zD8q5uPN+eO/UcVjtDgnQeqGVyS99gCS5o//+O5+2ifzLgcf6yn68RxRYDOH/41AfrkvWCGz1XNn3e7hOZW7d2e/hkMUKcygXK0ATr84LSQwMUnS40/Lns5QAO3XQjQcBtd98yD5WILdE1dgB76FdIMxpsboP5lEmPKNr9/cNe72wqhvTQ3B//T0BpDX/mvn7vJvQVb+bdj33XbqP69X3hEbkvP78R5dd+Pndzcz5D3gdYPPd3xzkPPJbik2UbvZEnT5+8I3Uezon73PP32wjqZPouzARp4+FcF6LDlOyw7eN+T573rH337CALpNa1MqBy74fl2C/+P8a68I4qT202WvRigoduGAzTcRlc+84k0J+jMCgjQt/p/zcprDoH+dALUX8GTUWp/6I78aLbF50fc8CtjXx2cbnG6bXqhxjxV6+/sAr906RE5dxJ4mkNU9o+8eWh9rE6fTXjh05+HqhlekvPYgksKbckeF+9jVsTu2wvrZLq0cwEaevhXBWh7w6fJ4i5VsP3N0wM6DE89FKBjZYLlmHSLL/Sy5pZg/LWlAA3eNhigZ1b+Fc/c57zMP5QSAvSrPwh6aNaRE6C7vgPcgzDdKHnHZbqmfPP+5WrX77itOQtQdw9kHFbnWNChmjyEavjGuIPjhPqlR+S0dOhp7vvbdA9hTPkn9xDDwgZB8M5DdxNe0vSxTZc0ef7TO56uscP4q910O0uZrZNpg5wL0IVCLF0H6izEOWkc3IMPr7724T/5B3Pde5tUJliO3fhk+1+vf8XZTT7T+OOyl64DDd42GKDh6t3wzKfleryT8EUE6LE/CNocAj2OATrbSBvn7sdfvOSYTclkFIcX0NpuHNZpUow7yk7meG9jeRruwr/4yju183L5EU2ze/o0m3+5G1RDR7856do+2Fl+Bu88eDfhJQUfm/M0QifMpnfsrDE3GsYjukvrxHExQBcKcUWAOi+Yh8BdL62+0EtHIECfzpVj2B0e/j3N9DONPz7ShQAN3zYYoMHq3fLMe90L4OPtwBcSoPtq3DF9cQK0WTPufsXYR3/9d9W49v0ZaH518lroHfLqXkyH33W6rbnZ+K9P72Tt+MC8s1d+c+7c3dYzj2j6Trzp02yK4R5Fe5p9b3l/aeHOA3cTXtLkyMZsSf7z94TWmHsabCzp0jpxXBeg80JcEaDOC6ZzxcOlCrp7vd5ZdT9Ax8qEyjFsIg6/P16D4txPuPEnl4qE3okUuu1ygE6rd8szdx/JQ25/FhKg9f9PK7c9BOoF6GDWR/66dxtoPHw4cnvz6Bz/cvpqMpVPs5s5J5rctp/+1pWPKNzSk6d5+nFz299W41Ff/zBf+LKRS3c+3k14SeNjCy/Jf/5h0wAdXysq55hIYJ04rtuFnxfimgAd7t6/GudSBQMfRzIP0EBlpgHqno5zz4NebPw37yehAA3ddnkXflq9W56581sJrq+VKCJAm7X71h0CDQbowhVD/W/NT0dMeti/gjr8Xvg+N52umVx4PdzOP+N48H/rukcUbGn3aTbFeWlfVf6lfYUZdrm8pc9f+C/duXM34SVNLk6YLemKM67uU5lsWlXOq1BgnThuO4k0FuKaAB0W0hX62gp27ec8+1mABirjlsN9qrML5i41/vjziwHq3vbySaT5hublZ+48hwc8f9QoIkCbVf3U78lP+mg/XZXuN7q1FljrgevHh2EdNzHdvur3V5w8nBy8HL50txtmMXvdI5q29OxpdhtGzavKn9rTbLvhXv0zrZfOrjp3Prub4JLOBeiQfYt7bLP78LY1d95CAuvEcetlTDccAx3vcX9bBbsfLWyzBSozK8csQN3r3i41fvjdDtMADXfThcuY3Is+rnvmzvN/0PwsIEDr1dZE51+6j+Ry+2hyAcwsQJ1D4AtrvXVNgPZdOL0IdClA/cWZAjT0NLu4bE+sNa8wzS2CLxmTyVi68+DdhJZ0VYCGd9lC9+FtomsDNFyIqwK0W3izgIW90lkFj0PonNsCdZYWKsc1AbrY+OOyFwM0dNuFC+nn1bvpmY/LeMTzR40yArRe5c1+6rBL5V3wMVy05J2MdA4lXXwbmb+XvfBxdu3hc/fA+dld+OH7y7vwV747Ofg028X+1/HE2o8/+4t058S/94U7D99NaEmTAJ0taTlAg/cRDtCldeJYCNBLD/+6AO1iuPn59Bkur74hYM4cA538aFqOKwJ0ufEvB2jwtgsBOq/eTc98/P5DnkCqlRGgzer9h249jH3kHA0NnIx0x+jShylccRKp74R/m7b35CTScAzQD1DnndjjlFwXoOGn2f77N+2JteZI6B/nM9APy6R/g3e+cDehJYVPIo0WAzR8H2cCNOok0qWHf12Adi+Yh2CyLK6+cf9n+Sy8fw+zclwO0DONfzFAw7ddDtBp9W555o3gJvzDKCNAvRe3sY+mV7dN+sg5JnRmn3J686XLmPql/Nb5zbOXMYU/eqTfLr70iMIhNV9U+xRnr/4fz95282Q0gne+cDehJY2PLfw0Fp9c+D7CAbq0ThxOgLpx614WFSzEdQHa7mv8IfhUlp5h6JMRlgM0XI7LAXqh8edPzLlB+LYLARqo3i3PPANlBOjw6vZynMWq++ZJv4+ceHM/zOYQeAF1L9p2P/vV76vuerbpBLhnVpwLySc7au712S+XH1F4N9m7UqXfuXLfsuK8S/TJKWLwslf/zoN3s7CksSzhp7E0ZAtPJRygS+tk+jzct4O+Ob+8/PCvDNDhFSqwdhZWX/eY/937QI3FAF0ox8UAvdT48yc2PoSF24YCNFy9W555BgoJUPftNtPt0vFNZdM+cjZBx3eyuG97GY1vxOxTMvQnPfqJGgaqe9kNvpVzvIvxU03ahY9bEWce0fREzfRpjo/UueDRDQL3zabBrU3/zsN3E17S7Pjs5GmcD9DZUwkH6NI6mTaIe92B+8vLD9+70vJMgPYbVaEtqvDq6yNp77bJ7LpOP0Bn5bgyQM80/uyJjQ9h4bZnLqSfVu+GZz4+y4eN1EIC1D3BN9l/dDXrbewj58DZ5BMU5pcy76bLCgWoH1PDnc2WOw2QycKdjeLlR3TpafpvkOtSwzsIeGbhoTsP3k14SU5Zgk9jcRc+/FQWAnRhnUyfxtInj7wtF2J4GC9nA7RfZuiZBJ/3cKDBe+e9e2+BSwtm5bi8C3+p8ScN5D2E8G3PvG0j/CSveuZjFQnQexg7xn0zw7iu3RX8V/27cNw+cg57+dduLOwxd343LGvSV4E9yX1oudMA8af7h/NWl+VHdOlpHr0thMk1eJMmnz/dwJ2H7ya4pOVLrJx9w9DMhO9jKUDD68ThHp5wHkf7RwtC0/4yKc/5AO1XbvBcX+B5OwcdPpxdWffeQkfHp+W4HKAXG3+6kpyHEL7tNdeB9nW4/pkfh58RoPcwPWoVfn964228usjpo3a9ukcfu98O3NkYci8fi321n988dPB8HiBOzg4pcP4RXXqaR+dlf/7IvMgOPd3AnYfvJrQkryyBJS2fIQvex1KAhtfJdGnO9Q39atiPjyVciH7b9ul8gI7HBa6qYLtU9/iivyX9tHiQwCvHFZcxXWr82UpyHkLwttdcB+q/SfSqZz4sgwC9h/A5gvm1mc3aCl6A7Z6P7df74jnC4aD5coAGP9ms6zLn26EACW3NnHtEl57mcMfOVaHeI+tm5sLT9X4evpv5kiZlmS3p3CUGgftYDNDgOnFMVsdwSs8J0IVCTA6ZLgSod/hybvK8vWPZzrFG995m9xAox1XvRLrQ+MfpSnJfCwK3Xb6MKdhGVz/zIwEKPKrg65nSxat1kTkCFOVKHaDnLy/HBhCgKFfoTbJKF9/tgNwRoCiWe44whfk1jdgaAhRlGk4Fpwm44bKJh/0YDCgQoChTf9VSokOUw0VRbIBuGgGKMvWbiKGLXAUO5GcRCFCUaedee6g3e0MNNokABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoMAmff7PG37vUH3/Jemj2SoCFNiiXfV2w+8RoJEI0DjXN9zn67efzpcfz86Xn6/VyPu1i8vBVFvZvkwfz01Fm//990ul62907UZbBk6tdVWAdr9HgEYiQOMQoA/HC9BDXdHvv7T/+19XBui1G205IEDXQYDGkQXodkb23rzK7tr1s7tuNbXraFNrgwBdBwEahwB9OJMAfXL+d8lWAnQ/7Mnsmp2a+sl/vQ/f3Fc/fu1+ry9L/3uHbnN9KGGzqJelxfvLPZX++y/N3tRbt1f1cmYp20KAxiFAH07xAdpGWpubQ4Duq/GbfYVOv9g/USdA/9D+XvOT/tiS2+Tu4v3l1gH6b+1XL4fu/0tL2RoC9AbOK/C5V+w+XNuBHAJ03/z6pQB1X9i9e/SW093T5+v3P733TZ+la7Zd3GcZ3KRxK9uUaVe53obS1d9vN8IC62jcaMvUvuoO/zqvBh/PTbVOX9Xf3LWlq4ve32jYhW+e+umruj6nJuyW0W2yzhbvL7c+VffU9e7pFqf/13cQXMrWEKBX816Bz71iBwO0/43fnQ9Q74Xdu8fJcpq7OEXLH/J+hb9m22V8lsFNGr+yZwK0HvMz6yj7APU2t7vW6vfaT8/9rX7WzVd75xfHAG2+18bjYXjRdvrTW7y/3NN/u1u33+7vLbCUrSFAr+a9AgdfsU99U38VCtA6C7uNrHMB6r+wTzYpuuU4r+r14k6//39WrILY2W2Xrp7Dswxu0kwqO5xQd3bhhz30NoO7F8DZOsp90L0zZpMn4/fivAX7sGs2408l7bLSjdrgCbn25m1gjv9vvhteytYQoFfzXoHDr9j9K+98OJ1X46XLmOrk9F/YJ5sU822DLg0ydn7bpf1qeJbBTZpJZZcD9NBvezpfbCpAD+7hDe/J9AdJ2n34j2fn9WdyFr75crztwXmp8hbvL7c/LtXf8MxStoYAvZr3Cuy9Yo9J1/wjNJy78dX4XIA6P3ibbVLMtw1Ov5b5Kc7gtsuknv2zXNow8iq7HKDdt9p72GKA9sd/nKfpHAbqcvIUZXu3aRYCdOB0oLt4f7ljgDpBurCUjSFAr+a9AnsNd2qm7vvNFmRgOMffuOYsfP/CPtmkON1w8qqe/ciHt10m9fR+1nA2aaaVXQzQ8RfbJWwwQLuOmZxEqtozbM2X9RP19uBvCVB38f5yCVBcwX0FXtzlOX07HKDdb3hXNc1H1t9g8Dcp2gB1mzL/kV8aPbeeToDOJ3Ja2cUA9Wu10QA9tlUaX3X6nZh+C/+0D+/twV/YhV9cvL/cC2txywjQW4yvwIkCdLLB4G9SEKAE6DWcog1P6dBdLnLadv/XwMGipT2qpcVPlhtci+eXshUE6I26V+BrduH7UyA37MJPNxicewykwAZG/sLoLezCO4y78M46yr2awxMMBGh3qUL9je9/8N7YEQrQU9m7F6h94FiJG6DdcoNrMbiUzSFAbxbYypyeRPLPIbdnMLoeOlRnAnS2weDcYyAFch/549LozU4i9dMa2KSZVPbiSaTldZR7NfdVf9jzpT/z1l0WNpyFb95L4KVZd4ZuukU+vCH0Lbj4yXLDazG4lK0hQK/lv8D7DeeP43i8aRzO/nvdpYydpQBtX9inmxTtpaHuq3ruI780erPLmNpnGdykmVT24mVMbWKE1lHu1RyOn3eXJtcHz7s3D1R/O/aS/yrU/Z7fz+PRkpeFxfvLDa/F4FK2hgC9mvcC7zfc7MLv+oe7yhnOYVLPXkg/eWGfbFJ0Q+4vLuuRXxq9WT3bZxnepNldeSF9W9yxxLN1lP9FYYfh9KN7Mqk769O+5sw+FbH9vUmAducvJyfPp4sflrsQoOGlbAsBejXvFXjhFbv9ZvemxH9y38rZ3/ofFz8PtP24B/eF3bvHyVs5+3csbTJA/XqOzzK4SeNXdjlAh+J2Z1Nm66jbGNs2/xw8rAjQGxzc+Qu9Yvdz3X4cunuGt7v1/MNE/ACdbjA49+h/mMjk3rN1ftul/zCR8VkGN2ncyp4J0HaDs79xYB11G22bts99K/vBEKBAOdwPYoIAAQqUYrftEzr3QIACpdiTn2oEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAETabIBWiEdBxSioWtr0uN7DPBCxe6/fzFFQMQqqlj5DrvIoj0Otqv4LYoXn/d6PKmMUVI0ATYz2NGDexSioGgGaGO1pwLyLUVA1AjQx2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqEaCJ0Z4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKgaAZoY7WnAvItRUDUCNDHa04B5F6OgagRoYrSnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSNAE6M9DZh3MQqqRoAmRnsaMO9iFFSNAE2M9jRg3sUoqBoBmhjtacC8i1FQNQI0MdrTgHkXo6BqBGhitKcB8y5GQdUI0MRoTwPmXYyCqhGgidGeBsy7GAVVI0AToz0NmHcxCqpGgCZGexow72IUVI0ATYz2NGDexSioGgGaGO1pwLyLUVA1AjQx2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqEaCJ0Z4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKgaAZoY7WnAvItRUDUCNDHa04B5F6OgagRoYrSnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSNAE6M9DZh3MQqqRoAmRnsaMO9iFFSNAE2M9jRg3sUoqBoBmhjtacC8i1FQNQI0MdrTgHkXo6BqBGhitKcB8y5GQdUI0MRoTwPmXYyCqhGgidGeBsy7GAVVI0AToz0NmHcxCqpGgCZGexow72IUVI0ATYz2NGDexSioGgGaGO1pwLyLUVA1AjQx2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqEaCJ0Z4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKgaAZoY7WnAvItRUDUCNDHa04B5F6OgagRoYrSnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSNAE6M9DZh3MQqqRoAmRnsaMO9iFFSNAE2M9jRg3sUoqBoBmhjtacC8i1FQNQI0MdrTgHkXo6BqBGhitKcB8y5GQdUI0MRoTwPmXYyCqhGgidGeBsy7GAVVI0AToz0NmHcxCqpGgCZGexow72IUVI0ATYz2NGDexSioGgGaGO1pwLyLUVA1AjQx2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqEaCJ0Z4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKgaAZoY7WnAvItRUDUCNDHa04B5F6OgagRoYrSnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSNAE6M9DZh3MQqqRoAmRnsaMO9iFFSNAE2M9jRg3sUoqBoBmhjtacC8i1FQNQI0MdrTgHkXo6BqBGhitKcB8y5GQdUI0MRoTwPmXYyCqhGgidGeBsy7GAVVI0AToz0NmHcxCqpGgCZGexow72IUVK2oAP18rapvP4/7H7+ucGcd2tOAeRejoGoFBWgdn22AVtVb8nvr0Z4GzLsYBVUrJ0Db/KwDdFetmKC0pwHzLkZB1YoJ0K/3qvrx68fzKUDrBP3+S+L769GeBsy7GAVVKyZAD1X1cjy2AVrvxL8kvr8e7WnAvItRULViAnRX1aeOugA9bY6udSKJ9jRg3sUoqFopAXqKzHqbswvQ0yboWvvwtKcB8y5GQdVKCdDP1+a8UR+gBwI0B8y7GAVVI0AToz0NmHcxCqpWSoBOduF3HAPNAfMuRkHVSgnQU2TW25xdgJ62R58S31+P9jRg3sUoqFoxAXqo6sxsA7S+JnStK+lpTwPmXYyCqhUToO3V802A7qtqtT142tOCeRejoGrlBGj3Vs7Wam9Eoj0tmHcxCqpWToA2O+6r5yftacG8i1FQtYICdIjQFeOT9jRh3sUoqFpRAXoPtKcB8y5GQdUI0MRoTwPmXYyCqhGgidGeBsy7GAVVI0AToz0NmHcxCqq2/QD1Ll9a/0Im2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqbT9Ae4fmD8rV6kjlj8rlgHkXo6BqxQTox7PzZ5AOfZamR3saMO9iFFStmADdeR9gt+Pj7HLAvItRULVSArT7RPoen0ifBeZdjIKqEaCJ0Z4GzLsYBVUrJUC/3ie78PxJjwww72IUVK2UAK0/T3ncBN1XHAPNAfMuRkHVignQj+fh2s/6n5yFzwHzLkZB1YoJ0OYPeYy4DjQHzLsYBVUrJ0DrK+l7q21/0p4mzLsYBVUrKECHd3XyifS5YN7FKKhaUQF6D7SnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSslQGcfasc7kTLAvItRUDUCNDHa04B5F6OgagRoYrSnAfMuRkHVSglQ19f7au+Epz1NmHcxCqpWYoDW70paLUFpTwPmXYyCqpUZoKdt0LXey0l7GjDvYhRUrcwAXXETlPY0YN7FKKhasQHKSaQMMO9iFFSNAE2M9jRg3sUoqFqZAfr5yi58Dph3MQqqVmSA1heF8on0GWDexSioWikBOr2Qnk+kzwHzLkZB1UoN0Je0dzeiPQ2YdzEKqlZmgK74kcq0pwHzLkZB1UoJ0LuhPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKhaKQH6+eqdd99xHWgOmHcxCqpWbIDyTqQMMO9iFFStzAD9fCVAc8C8i1FQtQICdF+FsAufAeZdjIKqFRCgs7/mseqV9LSnAfMuRkHVCgjQ4+GO+Ul7WjDvYhRUrYQArU1OIq2H9jRg3sUoqBoBmhjtacC8i1FQtVIC9G5oTwPmXYyCqhGgidGeBsy7GAVV236A1ifh3+an4rkONAPMuxgFVSNAE6M9DZh3MQqqRoAmRnsaMO9iFFRt+wF6Z7SnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSslQPk80Bwx72IUVK3YAOUkUgaYdzEKqlZmgPJ5oHlg3sUoqFoBAcrngWaLeRejoGoFBCifB5ot5l2MgqoVEKB8Hmi2mHcxCqpWQoDW+Di7HDHvYhRUjQBNjPY0YN7FKKhaKQF6N7SnAfMuRkHVSglQLqTPEfMuRkHVig1QrgPNAPMuRkHVygxQLqTPA/MuRkHVCghQLqTPFvMuRkHVCghQLqTPFvMuRkHVCghQLqTPFvMuRkHVSgjQGteB5oh5F6OgagRoYrSnAfMuRkHVSgnQu6E9DZh3MQqqVmqAfv6ey5geH/MuRkHVCgpQ/1wS14FmgP3Vkb4AAB98SURBVHkXo6Bq5QToriJAc8O8i1FQtWIC9OPZD9C3xPfXoz0NmHcxCqpWTICeNkCf6nclPbX/Xis/aU8L5l2MgqqVEqBf782bNw/trvt+tT142tOCeRejoGqlBOjna/Pmo4/n5nLQU5yyC58B5l2MgqoVFKBv4/+6Xfk10J4GzLsYBVUrLEBPm57Nu+A/nvk0pgww72IUVK2wAD3u2k3Pj2cuY8oA8y5GQdVKCdB+03PffhDogetAc8C8i1FQtVICtD/xfqias0h7PlA5B8y7GAVVKyZAP56b6Dz97xSdh4qTSDlg3sUoqFoxAdq8lfNlfEcnlzFlgHkXo6Bq5QTo13uTmt0f+IjeAA38gZCzh1NpTwPmXYyCqpUToMfjof1M5Z3tL3rM/0YdAZoK8y5GQdVKClCRj+dbtl9pTwPmXYyCqhGgt+veFnod2tOAeRejoGoEaITuHfVXoT0NmHcxCqpGgMa44TJS2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqEaCJ0Z4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKgaAZoY7WnAvItRUDUCNDHa04B5F6OgaqUE6Oer//l1X//MJ9I/PuZdjIKqlROg3puH+JMeWWDexSioWkEBOn6Icv0FAZoB5l2MgqqVEqD1h9BV3UZo86H0/E2kDDDvYhRUrZgA7XLzpU3S6z9NyYr2NGDexSioWkEB2kZnVdk+kP5WtKcB8y5GQdVKCtD+L8qt9Qc5G7SnAfMuRkHVigrQ+u/KXfobRmq0pwHzLkZB1UoK0PHPwbELnwfmXYyCqpUToP3Jo+aCJk4iZYF5F6OgaqUEaLv33h79PKx5IJT2NGDexSioWikB6l07X6cpF9JngHkXo6BqBQWo+2Z43sqZBeZdjIKqFROgf++/84gPE8kB8y5GQdVKCdC7oT0NmHcxCqpWVIDWB0K//Tzu13offI32NGDexSioWkEB2ly/1ARoVb1d/nUR2tOAeRejoGrlBGibn3WA7qoVE5T2NGDexSioWjEBWl+69OPXj+f6Evrdim/npD0NmHcxCqpWTIAemjdwtgFa78Sv9W5O2tOAeRejoGrFBOiu+QjlLkBPm6N8oHIGmHcxCqpWSoCeIrPe5uwC9LQJyoX0GWDexSioWikB2r0TqQ9Q3omUBeZdjIKqEaCJ0Z4GzLsYBVUrJUAnu/A7joHmgHkXo6BqpQToKTLrbc4uQE/bo3ycXQaYdzEKqlZMgB6ajwBtA7S+JnStK+lpTwPmXYyCqhUToO3V802A7lf8s/C0pwXzLkZB1coJ0O6tnNXKf1eO9jRg3sUoqFo5Adr/Tc6V/y4n7WnAvItRULWCApQ/a5wd5l2MgqoVFaD3QHsaMO9iFFSNAE2M9jRg3sUoqFp5AVr/ffgVP5Ke9jRg3sUoqFpBAfr52n4eU/exyiuhPQ2YdzEKqlZOgB6as0f9qXg+UDkHzLsYBVUrJkDrLc/Tdufpf6fs5AOV88C8i1FQtWICdN+8lbOPzh3vhc8B8y5GQdVKCdDuM+hP/2sOf/Jxdllg3sUoqFopAdp9Hujpf01yEqBZYN7FKKhaYQHafiYTAZoJ5l2MgqoVFqC77nPs9nygcg6YdzEKqlZKgLafSN8fAuUDlfPAvItRULVSAvS07dl+Emh/MT0fqJwB5l2MgqoVE6DtO5Ca4NzxgcqZYN7FKKhaMQHafA59G5x7PlA5E8y7GAVVKydA6zPw/Sn4tfbfj7SnCfMuRkHVCgrQ+6A9DZh3MQqqRoAmRnsaMO9iFFSNAE2M9jRg3sUoqBoBmhjtacC8i1FQNQI0MdrTgHkXo6BqBGhitKcB8y5GQdUI0MRoTwPmXYyCqhGgidGeBsy7GAVVI0AToz0NmHcxCqpGgCZGexow72IUVI0ATYz2NGDexSioGgGaGO1pwLyLUVC17Qfo52sVwp/0yADzLkZB1QjQxGhPA+ZdjIKqEaCJ0Z4GzLsYBVXbfoDeGe1pwLyLUVA1AjQx2tOAeRejoGoEaGK0pwHzLkZB1UoN0M/fcwz08THvYhRUraAAPXASKTfMuxgFVSsnQHechc8O8y5GQdWKCdD+78L31vrDnLSnAfMuRkHVignQXfM3jffNHzberZeftKcF8y5GQdVKCdCv9+rHr/Vx0GbXfb/aHjztacG8i1FQtVIC9PO1ejnWO/Lffh6bOGUXPgPMuxgFVSsoQN/G/3W78mugPQ2YdzEKqlZYgJ42PesN0dOWaL1Dvwba04B5F6OgaoUF6HHXbnp+PHMZUwaYdzEKqlZKgPabnvvmXFJ/MmkFtKcB8y5GQdVKCdD+xPuhas4idTm6AtrTgHkXo6BqxQTox3MTnaf/naLzUHESKQfMuxgFVSsmQJu3cr6M7+jkMqYMMO9iFFStnAD9em9Ss/uA+rU2QGlPC+ZdjIKqlROgx+OhOfzZb4quhPY0YN7FKKhaSQF6F7SnAfMuRkHVCNDEaE8D5l2MgqqVEqCfr+3+e2fHZUw5YN7FKKhasQHKhfQZYN7FKKhamQH6+UqA5oB5F6OgagUE6L4KYRc+A8y7GAVVKyBAuys/J9a6kIn2NGDexSioWgEBOvlznOvmJ+1pwbyLUVC1EgK0NjmJtB7a04B5F6OgagRoYrSnAfMuRkHVSgnQu6E9DZh3MQqqRoAmRnsaMO9iFFRt+wFan4R/m5+K5zrQDDDvYhRUjQBNjPY0YN7FKKgaAZoY7WnAvItRULXtB+id0Z4GzLsYBVUjQBOjPQ2YdzEKqlZMgO7W2mefoD0NmHcxCqpWSoB+va/28SE+2tOAeRejoGqlBOjn63p/R85Dexow72IUVK2UAGULNEfMuxgFVSslQOuPZFrrT8F7aE8D5l2MgqoVE6DHj+e7bIPSngbMuxgFVSslQLmQPkfMuxgFVSNAE6M9DZh3MQqqRoAmRnsaMO9iFFStlAC9G9rTgHkXo6BqBGhitKcB8y5GQdUI0MRoTwPmXYyCqpUaoJ+/5xjo42PexSioWkEBeuAkUm6YdzEKqlZOgO44C58d5l2MgqoVE6Afz36ArvW+TtrTgHkXo6BqxQToaQP06XjcN5/JtFvxffG0pwHzLkZB1UoJ0O7TmA7trvt+tT142tOCeRejoGqlBOjna/VyrHfkv/08NnHKLnwGmHcxCqpWUIC+jf/rduXXQHsaMO9iFFStsAA9bXrWG6KnLdG1PtqO9jRg3sUoqFphAXrctZueH89cxpQB5l2MgqqVEqD9pue+/VTlA9eB5oB5F6OgaqUEaH/i/VA1Z5H2q306Pe1pwLyLUVC1YgL047mJzvYPexwqTiLlgHkXo6BqxQRo81bOl/EdnVzGlAHmXYyCqpUToF/vTWp2H02/2h+Jpz0NmHcxCqpWToAej4fm8Ge/KboS2tOAeRejoGolBehd0J4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUraAA5RPps8O8i1FQtWICtD4JT4BmhnkXo6BqxQToviJAs8O8i1FQtVICtN4AXe3aTxftacC8i1FQtVIC9PN1tXe/+2hPA+ZdjIKqFRSg610876I9DZh3MQqqVkqA9h9ntzra04B5F6OgaqUE6Ip/xMNHexow72IUVK2YAO0/kn5ttKcB8y5GQdWKCdD6k0DvsRNPexow72IUVK2cAK0TlOtA88K8i1FQtWIClHciZYh5F6OgasUEKO9EyhDzLkZB1UoJUN6JlCPmXYyCqpUSoJ+vXMaUH+ZdjIKqFRSgXEifHeZdjIKqlRKgvBMpR8y7GAVVKyVAj3s+TCQ/zLsYBVUrJkBPm6C8Eyk3zLsYBVUrJkDv9YF2tKcB8y5GQdVKCdBTfHIdaHaYdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKhaKQF6N7SnAfMuRkHVCNDEaE8D5l2MgqoRoInRngbMuxgFVSs1QD9/zzHQx8e8i1FQtYIC9MBJpNww72IUVK2cAN1xFj47zLsYBVUrJkD9P+hRrfa+TtrTgHkXo6BqxQTorvlA5faPG+/Wy0/a04J5F6OgaqUE6Nd78074Q7vrvl9tD572tGDexSioWikB2n2g8sfzt5/HVT+aifY0YN7FKKhaQQH6Nv6v25VfA+1pwLyLUVC1wgK0/2D6j+e1PtqO9jRg3sUoqFphAXrctZueH89cxpQB5l2MgqqVEqD9pmf3lz0OXAeaA+ZdjIKqlRKg/Yn3Q9WcRVrvLyTRngbMuxgFVSsmQD+em+g8/e8UnYeKk0g5YN7FKKhaMQHavJXzZXxHJ5cxZYB5F6OgauUE6Nd7k5rdR9OvtQFKe1ow72IUVK2cAD0eD83hz35TdCW0pwHzLkZB1UoK0LugPQ2YdzEKqlZMgO5We/e7j/Y0YN7FKKhaKQHafZjI+mhPA+ZdjIKqlRKgn6/rnTfy0J4GzLsYBVUrJUDZAs0R8y5GQdVKCdD62vnVPkTZRXsaMO9iFFStmADt3oO0OtrTgHkXo6BqpQRod/08f1QuK8y7GAVVI0AToz0NmHcxCqpGgCZGexow72IUVK2UAL0b2tOAeRejoGoEaGK0pwHzLkZB1QjQxGhPA+ZdjIKqlRKgn6/tRzF1dnwifQ6YdzEKqlZsgHISKQPMuxgFVSszQD9fCdAcMO9iFFStgADdVyHswmeAeRejoGoFBOjsEtDGWp9JT3saMO9i4YLCIn2GXCXh4zgEnvVqf9Nj9fW5LaGC3juFMkaA6qXPkKusexJpPfdevZkLFfTeKZSxhxl3qG01QCFGgBoQoJvFmsVVCFADAnSzWLO4CgFqQIBuVvJdeP/z6L/++T5/pBNWBKgBAbpZ6T/Ozr3y87DahfQQI0ANCNDNWuPzQN+cLwjQTBGgBgToZqVesx/PVf/2o11VrfdOJIgRoAYE6GalX7NNbr60Sco1TdkiQA0I0M1aYc020Vm1MYpcEaAGwQC9yzskNmP1AViwygNpNkKrpzXuCokQoAa8lVNv/REIWuNxfL03z3jd80d3Xr15C9bz3imUsXCA/g9EKylAx8+1W3EX/o7pswWhgt47hTJGgKqVE6D9yaPmgqb1TiLRngYEqBgBqlZKgLZ77+3Rz8P4z/RoTwMCVIwAVSslQL1r5+s0Xe9Petx7FWeMABUjQNUKClD3zfDrvZWT9jQgQMUIULViAvTv/XcerfZhIrSnAQEqRoCqlRKgd0N7GhCgYgSoGgGaGO1pQICKEaBqhQbojmOgOSBAxQhQte0H6Odr4JIlAjQLBKgYAapWUoAexrcgEaBZIEDFCFA1AjQx2tOAABUjQNUI0MRoTwMCVIwAVSNAE6M9DQhQMQJUjQBNjPY0IEDFCFA1AjQx2tOAABUjQNUI0MRoTwMCVIwAVSNAE6M9DQhQMQJUjQBNjPY0IEDFCFA1AjQx2tOAABUjQNUI0MRoTwMCVIwAVSsiQEMI0AwQoGIEqBoBmhjtaUCAihGgagRoYrSnAQEqRoCqbT9A74z2NCBAxQhQNQI0MdrTgAAVI0DVCNDEaE8DAlSMAFUjQBOjPQ0IUDECVI0AvV1zWqq/ovTSn5inPQ0IUDECVI0Avdm+PY3/7Wf7JQGaDgEqRoCqEaC3+niutz6/3qvqrfmaAE2HABUjQNUI0Fvtur33fZegBGg6BKgYAapGgN7o673Py+6t9QRoOgSoGAGqRoDe6PP1x6/dPw/NNigBmg4BKkaAqhGgN3IC9JSd334SoAkRoGIEqBoBeqOv9/70+7E+Dvr9FwI0HQJUjABVI0BvtRsvAa2/+PFnAjQZAlSMAFUjQG/VXsbUqa9mIkCTIUDFCFA1AvRmB/d9SHWCEqCpEKBiBKgaAXq7U2i+jV99PBOgqRCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GhCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GhCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GhCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GhCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GhCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GhCgYgSoGgGaGO1pQICKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJlbBIlTQe6dQxghQNQI0sXsnUOZCBb13CmWMAFUjQJGXe0d65kIFvXcI5YwARV7unUCZCxX03iGUMwIUKBoBakGAAkUjQC0IUKBoBKgFAQoUjQC1IECBohGgFgQoUDQC1IIABYpGgFoQoEDRCFALAjS1e185nbV7r7wSEKAWD9Ojj/I41O4dQZm79+orAAFq8TAt+iiPQ62q/jdiBbvz3pmetWA97x1COSNAEyNADcJv3YZBqKD3DqGcEaCJEaAGzLsYBVUjQBMjQA2YdzEKqkaAJkaAGjDvYhwT0UufIVd5lMehRoAaEKBiBKhe+gy5yqM8DjUC1IAAFXuYcYfaVtcsAWpAgIoRoJu11TVLgBoQoGIE6GZtdc0SoAYEqBgBullbXbMEqAEBKkaAbtZW1ywBakCAihGgm7XVNUuAGhCgYgToZm11zRKgBgSoGAG6WVtdswSoAQEqRoBu1lbXLAFqQICKEaCbtdU1S4AaEKBifMCqXPIEudLDPBAxAtSAABXjvfB66TPkKo/yONQIUAMCVCxc0Huv5pwRoPE+nk+vPy8Xfon2NCBAxQhQNQL0dodTbj4dj/t2C/77L2d/mfY0IEDFCFA1AvRmuyY3f/zHc/XWfPXj13O/TXsaEKBiBKgaAXqrQ/XtZ5uib83X+/N78bSnAQEqRoCqEaC32jXB+fXeb3l+vp7dBKU9DQhQMQJUjQC90edre9BzXx8GrX29nz0KSnsaEKBiBKgaAXqjfoPzQICmR4CKEaBqBOiN+i3Q48d/Zhc+NQJUjABVI0BvtZucNBr25cNoTwMCVIwAVSNAb/Xx7Cbm13tzUn4Z7WlAgIoRoGoE6M0OzsXz++pCftKeFgSoGAGqRoDe7ut9OOp5uHAZPe1pQoCKEaBqBGhitKcBASpGgKoRoInRngYEqBgBqkaAJkZ7GvDxlXJ0qBYBmhjtaUCAytGhWgRoYrSnwcN055bRoRYP06KP8jjUaE+Dh+nOLaNDLR6mRR/lcajRngYP051bRodaPEyLPsrjUKM9DR6mO7eMDrV4mBZ9lMehRnsaPEx3bhkdavEwLfooj0ON9jR4mO7cMjrU4mFa9FEehxrtafAw3blldKjFw7ToozwONdrT4GG6c8voUIuHadFHeRxqtKfBw3TnltGhFg/Too/yONRoT4Ngd977vTxZo0PFCNDEaE8D3sopR4dqEaCJ0Z4GzLsYBVUjQBOjPQ2YdzEKqkaAJkZ7GjDvYhRUjQBNjPY0YN7FKKgaAZrYvU8aZC5U0HvPTMYoqBoBmti9EyhzoYLee2YyRkHVCFDkhXk3IEDVCFDkhXk3IEDVCFDkhXk34J0JeuuPQNCjPA48OALUgADVW38Egh7lceDB3XteMnfv1YdEWLO4yr0TKHP3Xn1IhDULAJEIUACIRIACQKTNBui9D3pl7d4rD8hEjrPy9V69XPqde0dQ5tZYjUD+chyV6wL0/yEWAQpcJ5dR+XydbSV9/+XM7xOgBgQocJ1cRoUAXREBuoY1DsVs173XXu9hHsglH89DYrILn9jjtOeG3TuBcnfv9dd5lMdxhV1VPTX/IEATe5ju3DI61OJhWvRRHsc1Thuh334eCdDk+LvwanSoGAEapd0IJUAT48OD5OhQLQI0zmkjtHojQBNj3sUoqBoBGmtfVX/9dwRoUsy7GAVVI0CjNRc0EaApMe9iFFSNADXYXxWgMKCgYhRUTZEkAo/yONTuvXozR0HFKKha+gy5yqM8DgDIDgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKhX01+v5L/92vd+cLMeWyP/+b949x0cMPlm/6Wv34VfQwkB8CFApugFbVt5/tdzMJ0F314v1jWPTwg2UEaNkIUCj4AVpVb8138wjQQ9XlZP+PftHDD84gQMtGgEJh72TNztkGTSdhgM5+cAYBWjYCFApugB4/nqv0qUKA4gEQoFDwArROnm4nPh0CFA+AAIWCH6D1XvzTsQu5U8QMSTf8++AcKa1//cevh2HHv/mZk0r+7/acAN05Z652/dGD0111/zptED/5t3VvcOiP2g7/6Bbtfd0fkjgtq3tkp+XXT5IALRsBCoVJgB7ai5naJNqP6ddt0zXh41zxdArQP/eRVu//u4k5fD3Z3hwCdDx/VSfZcGfjVvB+kr7+DSIDtFvIj/9LgBaNAIXCJEC7zb82iZwtwHb7cMjParhc6K+amHxyf9Zm1pCf0wTtA9Q9///ibG7u2+XN9/UnN4gL0GEhvyFAi0aAQmESoKfIqbf62iQa86fb39210TVm3K4a9tl37YZjnaPdQYD2xof+d527qHOx/sWXbtn1Mvq4rG/YLvP0A/eG0xtccRnTPED7206PNqA0BCgUzgXo+MNDv5E4Hp1s/rWrnCOL7c+6fxzmPxnvol72YcjV08LaO2t+7fTr/zBEr7sHP7tBTIDu+4e1ygUHeFwEKBTOBuhwoqXdg9+P25LdzXbDrcd4a49c7sbUPMzuwt+n705QnSLtpfnt7//+3CTnbumi1P6M1u0B6nxjT4AWjQCFwtkA7TOs25nejZuE3RHL8TuTEz7uOe7JyfRJgDa77F1at4usz+88NT8IJtxwg4gAdS4sGE/Lo0QEKBTmATqeRBqSaN+n6rBJ2MXPuJE42Vx0TjdNjzaOAXoYft6ldXvc9aW5OqrfInVNbhAVoP1D4TKmshGgUDh3Fr5Pme4rd9NxOKu0EKDOOfilAHV/pY+9t/q7b+3h0P10Dz50gxsD1NnsJEDLRoBCYX4daB0rzscanRKo2we/ZQv0zA6ycxa+jcJ+v/r0/5f6EOgvbYruJkuY34AtUEQjQKFw5p1I9dfNfnR/fHPnXVjfHrB0zslMjoEuvV9zPMPff3bn65DWP37ddTn3NLmIKXQDjoEiGgEKhdl74ZvEGQK0PpPzl/5sjnMWftefhe8DyrvI6Kk/GRUyvca0f/dTvfzvf3rvllu/w+ltcrPpDS5/nN1uctLdeVichS8bAQqF2acxTd4EtK++/Ut/Nid0Haizhdf9s83WcXsxfBmTd5H+uLn7j8/dJaDf/jh/A9P0BtcEaBfr/QX0Q2wOV+OjTAQoFJwAba4PakNqDNDmzM14oHN8J1KTPs6Rz+6dSPX/h0Oc/Y5/6EL67vfa91YO91o5J5jmHyQyucFwsX7/DydAxze+txeXdo+4D9/mDgjQghGgUJh8In0XdZNPTHJOvHinwd0AdX7WJPLBWap3OdL4TqTZ3bpvg58dApjfoD0t/zb+wz/B/+Y+qH96Hd7+2fobTiIVjQCFgh+gfWo6AXpwA3D+aUzjxuXws+63x6uO/Ms5x4v0O387HJgc72s3+xCnwA2amK1v0P/Dez/9uOlZ/3s46d59h09jKhwBCgU3QMdAcQJ0cj59+nmg7t75wc3gYdmTPXHvDH/Vf67ScKSyW94htIM9u0ETlE/jP9xzX/0yu79TMl611P2My5jKRoACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASASAQoAkQhQAIhEgAJAJAIUACIRoAAQiQAFgEgEKABEIkABIBIBCgCRCFAAiESAAkAkAhQAIhGgABCJAAWASAQoAEQiQAEgEgEKAJEIUACIRIACQCQCFAAiEaAAEIkABYBIBCgARCJAASDS/wcwJ/nfBcJBIgAAAABJRU5ErkJggg==" title alt width="672" /></p>
</div>
<div id="inference" class="section level3">
<h3>Inference:</h3>
<p>State hypotheses H0: People’s attitude toward the divorce laws and their opinion the extramarital sex are independent. The justification of extramarital sex do not vary by their attitudes to the divorce laws. HA: People’s attitude toward the divorce laws and their opinion the extramarital sex are dependent. The justification of extramarital sex do vary by their attitudes to the divorce laws.</p>
<p>Check conditions 1. Independence is met: the survey use random sample; n(3645)&lt;10% population. 2. Sample size is met: each particular cell of the table &gt; 5 expected cases.</p>
<p>The inference method is chi-square independence test. This method is suitable for analysis of two categorical variables and the variables’ levels are more than 2.</p>
<p>Perform inference Overall justification rate is 54/3645=0.015 Expected advocates: 1046<em>0.015 = 15 Expected obstructers: 1722</em>0.015 = 26 Expected neutrals: 877<em>0.015 = 13 check:15+26+13=54 The same computation of the overall rates of other rows. x<sup>2=(788-862)</sup>2/862 +(1559-1419)^2/1419 +(658-724)^2/724 +(133-111)^2/111 +(107-181)^2/181 +(144-92)^2/92 +(102-58)^2/58 +(38-96)^2/96 +(62-48)^2/48 +(23-15)^2/15 +(18-26)^2/26 +(13-13)^2/13 = 169.42 df=(4-1)</em>(3-1)=6</p>
<p>Interpret results of [1] 5.970443e-34, the value is so extreme that we reject H0 hypothesis. People’s attitude toward the divorce laws and their attitude toward the extramarital sex are dependent, and based on the exploratory analysis the divorce law easier advocates have a higher probability to justify than those who think divorce law should be more difficult or the neutrals.</p>
<pre class="r"><code>tab1&lt;-tab
totalLaw&lt;-rowSums(tab)
tab2&lt;-cbind(tab1,totalLaw)
totalSex&lt;-colSums(tab2)
tab3&lt;-rbind(tab2,totalSex)
tab4&lt;-as.data.frame(t(tab3))
pchisq(169.42, 6, lower.tail=F)</code></pre>
<pre><code>## [1] 5.970443e-34</code></pre>
</div>
<div id="conclusion" class="section level3">
<h3>Conclusion:</h3>
<p>Yes, those who think the divorce laws should be easier are also prone justify the extramarital sex as “no wrong at all” than those who think divorce laws should be difficult. According to this data analysis, if a person said he/she thinks the divorce laws should be easier, you can guess he/she pretends to justify extramarital sex. The H0 hypothesis is rejected because the result of chi-sqaure test is so small. However, the type I error may be occur if H0 is in fact true while we rejected it, so further research should be conducted to check the type I error.</p>
</div>
<div id="references" class="section level3">
<h3>References:</h3>
<p>Data source: <a href="http://bit.ly/dasi_gss_data">http://bit.ly/dasi_gss_data</a> The data above is General Social Survey (GSS). Its codebook is: <a href="https://d396qusza40orc.cloudfront.net/statistics%2Fproject%2Fgss1.html">https://d396qusza40orc.cloudfront.net/statistics%2Fproject%2Fgss1.html</a> The data Citation is: Smith, Tom W., Michael Hout, and Peter V. Marsden. General Social Survey, 1972-2012 [Cumulative File]. ICPSR34802-v1. Storrs, CT: Roper Center for Public Opinion Research, University of Connecticut /Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributors], 2013-09-11. <a href="doi:10.3886/ICPSR34802.v1">doi:10.3886/ICPSR34802.v1</a> Persistent URL: <a href="http://doi.org/10.3886/ICPSR34802.v1">http://doi.org/10.3886/ICPSR34802.v1</a></p>
</div>
<div id="appendix" class="section level3">
<h3>Appendix:</h3>
<p>A brief of dataset</p>
<pre class="r"><code>dataset&lt;-as.data.frame(data)
head(dataset)</code></pre>
<pre><code>##   divorcelaw extramaritalsex
## 1          3               1
## 2          3               1
## 3          2               1
## 4          2               1
## 5          2               1
## 6          2               1</code></pre>
<pre class="r"><code>tail(dataset)</code></pre>
<pre><code>##      divorcelaw extramaritalsex
## 3640          3               1
## 3641          2               2
## 3642          1               2
## 3643          3               1
## 3644          2               1
## 3645          1               1</code></pre>
</div>


</div>

<script>

// add bootstrap table styles to pandoc tables
$(document).ready(function () {
  $('tr.header').parent('thead').parent('table').addClass('table table-condensed');
});

</script>

<!-- dynamically load mathjax for compatibility with self-contained -->
<script>
  (function () {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src  = "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
    document.getElementsByTagName("head")[0].appendChild(script);
  })();
</script>

</body>
</html>
