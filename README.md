
setup.py のテストをする

まず
```
cd ~/sample_code/
```


## 何もない状態
最初
```
python3.8 cooking/pasta/tomato.py
```
を実行しても
```
File "cooking/pasta/tomato.py", line 1, in <module>
    from tool import  kitchen_knife
ModuleNotFoundError: No module named 'tool'
```
というエラーがでる


## setup.py を使う
pip install を setup.pyのあるディレクトリで実行
```
pip install .
```

してから以下を実行すると
```
python3.8 cooking/pasta/tomato.py
```

成功する
```
tomato
cut!
```
