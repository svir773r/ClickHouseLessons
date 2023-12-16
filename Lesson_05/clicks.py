
# --sql for create table for mouse clicks
# use svirin;
# create table clicks(x Int16, y Int16,  button String, pressed String) Engine = Log();

from pynput import mouse
import pandas as pd
import pandahouse  as ph

df = pd.DataFrame(columns=['x', 'y', 'button', 'pressed'])

if __name__=='__main__':
    def on_click(x,y,button, pressed):
        df.loc[len(df)] = [x, y, button, pressed]
        print(f'mouse click x:{x}, y:{y}, button:{button}, pressed:{pressed}')

listner = mouse.Listener(on_click=on_click)
listner.start()
x=input()
connection = {'host': 'http://127.0.0.1:8123',
              'database': 'svirin'}

affected_rows = ph.to_clickhouse(df, table='clicks', connection=connection, index=False)
print(f'affected_rows: {affected_rows}')




