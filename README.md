# ev3rt-build

ev3rtのビルド環境を提供するDockerfile

## Installation

ev3rtのビルド環境を素早く構築できます。
ev3rtのパッケージを含んでいるのでそのままビルドが可能です。
http://dev.toppers.jp/trac_user/ev3pf/wiki/Download

## Usage
下記コマンドでイメージの`pull`が可能です。
```
docker pull hakoai/ev3rt-build:beta6-2
```
例えば下記コマンドでコンテナに接続できます。
```
docker run --rm -v `pwd`:/root/source -i -t hakoai/ev3rt-build:beta6-2 /bin/bash
```
(`exit`するとコンテナ内のすべての変更が消えてしまうので注意してください。)

パッケージは`ENV EV3RT_LIB_PATH /var/lib/ev3rt`にあります。  
ワークスペースは`ENV EV3RT_WORKSPACE ${EV3RT_LIB_PATH}/hrp2/workspace`にあります。

接続後のビルド方法は下記で確認してください。  
http://dev.toppers.jp/trac_user/ev3pf/wiki/SampleProgram

現在提供しているバージョンは以下になります。
* beta5-2
* beta6-2

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

<!---
## History

TODO: Write history

## Credits

TODO: Write credits
-->

## License

MIT License
