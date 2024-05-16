## Gradient Descent

### Formula

$$
w:=w-\alpha\dfrac{\mathrm{d}J(w,b)}{\mathrm{d}w}\\
b:=b-\alpha\dfrac{\mathrm{d}J(w,b)}{\mathrm{d}b}
$$

> simultaneously update of parameters

| Correct                                                   | Incorrect                                                 |
| --------------------------------------------------------- | --------------------------------------------------------- |
| $temp\_w = w-\alpha\dfrac{\mathrm{d}J(w,b)}{\mathrm{d}w}$ | $temp\_w = w-\alpha\dfrac{\mathrm{d}J(w,b)}{\mathrm{d}w}$ |
| $temp\_b=b-\alpha\dfrac{\mathrm{d}J(w,b)}{\mathrm{d}b}$   | $w = temp\_w$                                             |
| $w = temp\_w$                                             | $temp\_b=b-\alpha\dfrac{\mathrm{d}J(w,b)}{\mathrm{d}b}$   |
| $b = temp\_b$                                             | $b = temp\_b$                                             |

### Learning Rate

> If $\alpha$ is too small, slow

> If $\alpha$ is too large, fail to converge or even diverge