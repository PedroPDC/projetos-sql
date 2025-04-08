import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv('cartoes_por_falta.csv')

df['cartoes_totais'] = df['cartoes_amarelos'] + df['cartoes_vermelhos']

plt.figure(figsize=(25, 15))
sns.scatterplot(data=df, x='faltas_cometidas', y='cartoes_totais', hue='Clube')
sns.lmplot(data=df, x='faltas_cometidas', y='cartoes_totais', aspect=1.5)

plt.title('Relação entre Faltas Cometidas e Total de Cartões por Clube')
plt.xlabel('Faltas Cometidas')
plt.ylabel('Cartões (Amarelos + Vermelhos)')
plt.grid(True)
plt.tight_layout()
plt.show()