---
jupytext:
  formats: ipynb,md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  name: python3
  display_name: Python 3 (ipykernel)
---

# 单电子 X 射线散射（Thomson & Compton)
(sec:single-electron)=

> 本章以“**单电子**”为微观散射体，梳理两类基石过程：  
> **Thomson**（弹性、经典）与 **Compton**（非弹性、量子）。读完可直接用于 SAXS/WAXS/GISAXS 中的强度、极化与几何判断。

## 1. 基本量与几何

- 入射/散射波矢：$\mathbf{k}$ 与 $\mathbf{k'}$，夹角记作 $\psi=\angle(\mathbf{k},\mathbf{k'})$。  
  常见记号：$2\theta=\psi$（衍射学里把 $\theta$ 叫“Bragg 半角”）。
- 散射矢量：$\mathbf{Q}=\mathbf{k'}-\mathbf{k}$，其模  
  
  $$|\mathbf{Q}|=\frac{4\pi}{\lambda}\sin\theta=\frac{4\pi}{\lambda}\sin\frac{\psi}{2}$$
- 极化向量：入射 $\hat\varepsilon$，散射 $\hat\varepsilon'$。  
- 微分散射截面（本征强度）：
  
  $$\frac{d\sigma}{d\Omega}=\frac{I_{\rm sc}}{\Phi_0\,\Delta\Omega}$$

## 2. Thomson：单自由电子的**弹性**散射（经典）

入射电场驱动电子做受迫振荡，远场以偶极辐射形式再辐射。结果是

$$\boxed{ \frac{d\sigma}{d\Omega}=r_0^2\,|\hat\varepsilon\!\cdot\!\hat\varepsilon'|^2 }\qquad(\text{Thomson})$$
其中

$$r_0=\frac{e^2}{4\pi\varepsilon_0 m c^2}\approx 2.8179\times10^{-15}\ \text{m}=2.8179\times10^{-5}\ \text{Å}$$
为**经典电子半径**（或 Thomson 散射长度）。

### 2.1 极化因子（实验几何很关键）
- **非偏振**入射光：  
  
  $$\left\langle|\hat\varepsilon\!\cdot\!\hat\varepsilon'|^2\right\rangle=\tfrac12(1+\cos^2\psi)$$
- **线偏振**（同步辐射近似水平偏振）：  
  若选择**竖直散射面**，极化惩罚最小（$P\!\approx\!1$）；  
  若在**水平散射面**，$P=\cos^2\psi$，大角度被强烈抑制。  
  > 经验：做弹性散射测量，把探测器布在**竖直散射面**更“吃极化”；做荧光时常把探测器放在**水平面且 $\psi\!\approx\!90^\circ$** 以抑制弹性背景。

### 2.2 角度平均与总截面
对各向平均后得到总截面

$$\boxed{ \sigma_T=\frac{8\pi}{3}r_0^2\approx 6.652\times10^{-29}\ \text{m}^2=0.665\ \text{barn} }$$
（在 X 射线能区对**自由**电子近似与能量无关）。

## 3. Compton：单自由电子的**非弹性**散射（量子）

把 X 射线视作光子，与静止电子散射，能量与动量守恒给出**康普顿位移**：

$$\boxed{ \lambda'-\lambda=\lambda_C(1-\cos\psi) },\quad
\lambda_C=\frac{h}{m c}=2.4263\times10^{-12}\ \text{m}=0.024263\ \text{Å}$$
等价的能量形式（$E=h c/\lambda$）：

$$\boxed{ E'=\frac{E}{\,1+\frac{E}{m c^2}(1-\cos\psi)\,} },\qquad m c^2=511\ \text{keV}$$
**要点**：Compton 是**非相干**的，形成随角度/能量缓变的背景；能谱探测器可把它与弹性峰分开。

```{admonition} 小结：Thomson vs. Compton
- **是否弹性**：Thomson 弹性（$E'=E$），Compton 非弹性（$E'\!<\!E$）。  
- **是否相干**：Thomson 可相干叠加（到原子/晶体），Compton 通常视为非相干背景。  
- **角分布**：Thomson 强烈依赖极化/几何；Compton 更平滑。  
```

## 4. 从“电子”到“原子/分子/材料”

- **原子弹性散射幅**：
  
  $$f(Q,\omega)=f^0(Q)+f'(\omega)+i f''(\omega)$$
  其中 $f^0(Q)$ 是电子密度的傅里叶变换（形状因子），$f',f''$ 是靠近吸收边显著变化的**色散修正**。强度 $\propto |r_0 f|^2$。
- **分子/纳米结构/晶体**：幅度按相位因子叠加；满足衍射条件时出现相干增强（Bragg/Laue）。  
- **GISAXS 关联**：大角度分辨通常受极化与几何强烈影响；小角区（小 $Q$）$f^0(Q)\!\to\!Z$（原子序数）是常用近似起点。

## 5. 常用换算与数值

- 波长/能量：$\lambda(\text{Å})=\dfrac{12.398}{E(\text{keV})}$。  
- $r_0=2.8179\times10^{-15}$ m；$\ \sigma_T=0.665$ barn。  
- 康普顿波长（用于位移公式）：$\lambda_C=h/(m c)=2.4263\times10^{-12}$ m（**不是**约化康普顿波长 $\hbar/(mc)$）。

## 6. 实操提示（避免常见坑）

- **极化/散射面**的选择能带来 2–10× 的强度差异；报告结果时应注明几何与极化修正。  
- 做定量强度比对时，用 **$d\sigma/d\Omega$** 或做 **通量/固角归一**，避免把器件因素混入。  
- 中高能、背散射几何下 **Compton 背景**不可忽略；若可用能谱分辨，先做能窗分离再做结构分析。

## 7. 练习（可在 Notebook 中直接运行）

```{code-cell} python
# 练习 1：12 keV、psi=90° 的康普顿位移与能量变化
import numpy as np
h = 6.62607015e-34
c = 299792458.0
me = 9.10938356e-31
mc2 = 511e3  # eV
lamC = h/(me*c)  # m
E = 12e3  # eV
psi = np.deg2rad(90.0)
# 位移（米 & Å）
delta_lam = lamC*(1-np.cos(psi))
delta_lam_A = delta_lam*1e10
# E'（eV）
Eprime = E/(1 + E/mc2*(1-np.cos(psi)))
E, Eprime, delta_lam_A
```

```{admonition} 练习 2（手推）
推导非偏振光的 Thomson 角分布 $\tfrac{1}{2}(1+\cos^2\psi)$；  
并画出水平/竖直散射面下的极化因子曲线，解释为何竖直面更“吃极化”。
```

