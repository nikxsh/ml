import matplotlib.pyplot as plt

numrows = 0
numcols = 0

def format_coord(x, y):
    col = int(x)
    row = int(y)
    if col >= 0 and col < numcols and row >= 0 and row < numrows:
        z = X[row, col]
        return 'x=%1.4f, y=%1.4f, z=%1.4f' % (x, y, z)
    else:
        return 'x=%1.4f, y=%1.4f' % (x, y)

def plot_corr_data(corr_data):
    fig, ax = plt.subplots()
    ax.imshow(corr_data)
    numrows, numcols = corr_data.shape
    ax.format_coord = format_coord
    plt.show()
