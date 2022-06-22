# %%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# %%
horizon = pd.read_csv(".\\data\\horizon.csv", encoding="utf-8", usecols=["幀率 [FPS]"])
horizon = horizon[:-2]

# %%
plt.figure(figsize=(21, 9))
plt.plot(horizon)
plt.title("FPS")
plt.ylabel("Frame per Second")
plt.grid()
plt.show()

# %%
